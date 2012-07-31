################################################################################ 
#  Copyright 2008 Amazon Technologies, Inc.
#  Licensed under the Apache License, Version 2.0 (the "License"); 
#  
#  You may not use this file except in compliance with the License. 
#  You may obtain a copy of the License at: http://aws.amazon.com/apache2.0
#  This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
#  CONDITIONS OF ANY KIND, either express or implied. See the License for the 
#  specific language governing permissions and limitations under the License.
################################################################################ 
#    __  _    _  ___ 
#   (  )( \/\/ )/ __)
#   /__\ \    / \__ \
#  (_)(_) \/\/  (___/
# 
#  Amazon Cloud Watch Perl Library
#  API Version: 2009-05-15
#  Generated: Sun May 17 01:34:49 PDT 2009 
# 



package Amazon::CloudWatch::Client;
use strict;
use warnings;
use Digest::SHA qw (hmac_sha1_base64 hmac_sha256_base64);
use XML::Simple;
use LWP::UserAgent;
use URI;
use URI::Escape;
use Time::HiRes qw(usleep);
use Carp qw(croak);

use File::Basename;
use XML::LibXSLT;
use XML::LibXML;
use Cwd ();



use Amazon::CloudWatch::Exception;

my $SERVICE_VERSION = "2009-05-15";

 #

 # Amazon::CloudWatch::Client is the implementation of service API
 #
 #

    #
    # Construct new Http Client
    #
    # Valid configuration options are:
    #
    # ServiceURL
    # UserAgent
    # SignatureVersion
    # MaxErrorRetry
    # ProxyHost
    # ProxyPort
    # MaxErrorRetry
    #
    sub new {
        my ($class, $awsAccessKeyId, $awsSecretAccessKey, $config) = @_;
        my $defaultConfig =  {
                            ServiceURL => "https://monitoring.amazonaws.com",
                            UserAgent => "Amazon CloudWatch Perl Library",
                            SignatureVersion => 2,
                            SignatureMethod => "HmacSHA256",
                            ProxyHost => undef,
                            ProxyPort => -1,
                            MaxErrorRetry => 3
                          };
        my $self = {};
        $self->{_awsAccessKeyId} = $awsAccessKeyId;
        $self->{_awsSecretAccessKey} = $awsSecretAccessKey;
        $self->{_config} = $defaultConfig;
        $self->{_config} = {%$defaultConfig, %$config} if defined ($config);
        $self->{_xml_parser} = XML::LibXML->new();
        $self->{_xslt_parser} = XML::LibXSLT->new();
        return bless ($self, $class);
    }

    # Public API ------------------------------------------------------------#


        
    #
    # List Metrics 

    # See http://docs.amazonwebservices.com/${docPath}ListMetrics.html
    # Argument either hash reference of parameters for Amazon::CloudWatch::Model::ListMetricsRequest request
    # or Amazon::CloudWatch::Model::ListMetricsRequest object itself
    # See Amazon::CloudWatch::Model::ListMetricsRequest for valid arguments
    # Returns Amazon::CloudWatch::Model::ListMetricsResponse
    #
    # throws Amazon::CloudWatch::Exception. Use eval to catch it
    #
    sub listMetrics {
        my ($self, $request) = @_;
        if (not ref $request eq "Amazon::CloudWatch::Model::ListMetricsRequest") {
            require Amazon::CloudWatch::Model::ListMetricsRequest;
            $request = Amazon::CloudWatch::Model::ListMetricsRequest->new($request);
        }
        require Amazon::CloudWatch::Model::ListMetricsResponse;
        return Amazon::CloudWatch::Model::ListMetricsResponse->fromXML($self->_invoke($self->_convertListMetrics($request)));
    }


        
    #
    # Get Metric Statistics 

    # See http://docs.amazonwebservices.com/${docPath}GetMetricStatistics.html
    # Argument either hash reference of parameters for Amazon::CloudWatch::Model::GetMetricStatisticsRequest request
    # or Amazon::CloudWatch::Model::GetMetricStatisticsRequest object itself
    # See Amazon::CloudWatch::Model::GetMetricStatisticsRequest for valid arguments
    # Returns Amazon::CloudWatch::Model::GetMetricStatisticsResponse
    #
    # throws Amazon::CloudWatch::Exception. Use eval to catch it
    #
    sub getMetricStatistics {
        my ($self, $request) = @_;
        if (not ref $request eq "Amazon::CloudWatch::Model::GetMetricStatisticsRequest") {
            require Amazon::CloudWatch::Model::GetMetricStatisticsRequest;
            $request = Amazon::CloudWatch::Model::GetMetricStatisticsRequest->new($request);
        }
        require Amazon::CloudWatch::Model::GetMetricStatisticsResponse;
        return Amazon::CloudWatch::Model::GetMetricStatisticsResponse->fromXML($self->_invoke($self->_convertGetMetricStatistics($request)));
    }

    # Private API ------------------------------------------------------------#

    #
    # Invoke request and return response
    #
    sub _invoke {
        my ($self, $parameters) = @_;
        my $actionName = $parameters->{Action};
        my $response = undef;
        my $statusCode = 200;

        # Add required request parameters #
        $parameters = $self->_addRequiredParameters($parameters);

        my $retries = 0;
        my $shouldRetry = 1;

        eval {
            do {
                # Submit the request and read response body #
                eval {
                    $response = $self->_httpPost($parameters);
                    if ($response->is_success) {
                        $shouldRetry = 0;
                    } else {
                        if ($response->code == 500 || $response->code == 503) {
                            $shouldRetry = 1;
                            $self->_pauseOnRetry(++$retries, $response->code);
                        } else {
                            my $ex = $self->_reportAnyErrors($response->content, $response->code);
                            Carp::croak ($ex) if ($ex);
                        }
                    }
                };
                my $e = $@;
                if ($e) {
                    if (ref $e eq "Amazon::CloudWatch::Exception") {
                        Carp::croak $e;
                    } else {
                        Carp::croak (Amazon::CloudWatch::Exception->new ({Message => $e}));
                    }
                }
            } while ($shouldRetry);
        };
        my $e = $@;
        if ($e) {
            if (ref $e eq "Amazon::CloudWatch::Exception") {
                Carp::croak $e;
            } else {
                Carp::croak (Amazon::CloudWatch::Exception->new ({Message => $e}));
            }
        }
        my($file, $path) = fileparse( Cwd::abs_path(__FILE__));
        my $xml = $self->{_xml_parser}->parse_string($response->content);
        my $template = $self->{_xml_parser}->parse_file($path . "Model/" . "ResponseTransformer.xslt");
        my $transformer = $self->{_xslt_parser}->parse_stylesheet($template);
        my $results = $transformer->output_string($transformer->transform($xml));
        if ($results =~ m/^<ErrorResponse/) {
          Carp::croak (Amazon::CloudWatch::Exception->new ({Message => $results}));
        } else {
          return $results;
        }

    }

    #
    # Exponential sleep on failed request
    # Retries - current retry
    # throws Amazon::CloudWatch::Exception if maximum number of retries has been reached
    #
    sub _pauseOnRetry {
        my ($self, $retries, $status) = @_;
        if ($retries <= $self->{_config}->{MaxErrorRetry}) {
            my $delay = (4 ** $retries) * 100000 ;
            usleep($delay);
        } else {
            Carp::croak new Amazon::CloudWatch::Exception ({Message => "Maximum number of retry attempts reached :  " . ($retries - 1),
            StatusCode => $status});
        }
    }

    #
    # Look for additional error strings in the response and return formatted exception
    #
    sub _reportAnyErrors {
        my ($self, $responseBody, $status, $e) = @_;
        my $ex = undef;
        if (defined($responseBody) and $responseBody =~ m/</) {
            if ($responseBody =~ m/<RequestId>(.*)<\/RequestId>.*<Error><Code>(.*)<\/Code><Message>(.*)<\/Message><\/Error>.*(<Error>)?/msg) {

                my $requestId = $1;
                my $code = $2;
                my $message = $3;
                $ex = Amazon::CloudWatch::Exception->new ({Message => $message,
                                                              StatusCode => $status,
                					      ErrorCode => $code,
                                                              ErrorType => "Unknown",
                                                              RequestId => $requestId,
                                                              XML => $responseBody});

            } elsif ($responseBody =~ m/<Error><Code>(.*)<\/Code><Message>(.*)<\/Message><\/Error>.*(<Error>)?.*<RequestID>(.*)<\/RequestID>/msg) {

                my $code = $1;
                my $message = $2;
                my $requestId = $4;
                $ex = Amazon::CloudWatch::Exception->new({Message => $message,
                                                           StatusCode => $status,
                                                           ErrorCode => $code,
                                                           ErrorType => "Unknown",
                                                           RequestId => $requestId,
                                                           XML => $responseBody});
            } else {
                $ex = Amazon::CloudWatch::Exception->new({
                                                        Message => "Internal Error",
                                                        StatusCode => $status});
            }
        } else {
            $ex = Amazon::CloudWatch::Exception->new({
                                                Message => "Internal Error",
                                                StatusCode => $status});
        }
        return $ex;
    }

    #
    # perform http post
    #
    sub _httpPost {
	my ($self, $parameters) = @_;
        my $url = $self->{_config}->{ServiceURL};
        require LWP::UserAgent;
        my $ua = LWP::UserAgent->new;
	my $request= HTTP::Request->new("POST", $url);
	$request->content_type("application/x-www-form-urlencoded; charset=utf-8");
	my $data = "";
    	foreach my $parameterName (keys %$parameters) {
   	    no warnings "uninitialized";
   	    $data .= $parameterName .  "="  . $self->_urlencode($parameters->{$parameterName}, 0);
       	    $data .= "&";
   	}
    	chop ($data);
	$request->content($data);
	my $response = $ua->request($request);
        return $response;
    }

    #
    # Add authentication related and version parameters
    #
    sub _addRequiredParameters {
   	my ($self,  $parameters) = @_;
        $parameters->{AWSAccessKeyId} = $self->{_awsAccessKeyId};
        $parameters->{Timestamp} = $self->_getFormattedTimestamp();
        $parameters->{Version} = $SERVICE_VERSION;
        $parameters->{SignatureVersion} = $self->{_config}->{SignatureVersion} || "1";
        $parameters->{Signature} = $self->_signParameters($parameters, $self->{_awsSecretAccessKey});

        return $parameters;
    }

    #
    # Computes RFC 2104-compliant HMAC signature for request parameters
    # Implements AWS Signature, as per following spec:
    #
    # If Signature Version is 0, it signs concatenated Action and Timestamp
    #
    # If Signature Version is 1, it performs the following:
    #
    # Sorts all  parameters (including SignatureVersion and excluding Signature,
    # the value of which is being created), ignoring case.
    #
    # Iterate over the sorted list and append the parameter name (in original case)
    # and then its value. It will not URL-encode the parameter values before
    # constructing this string. There are no separators.
    #
    sub _signParameters {
     	my ($self, $parameters, $key)  = @_;
        my $algorithm = "HmacSHA1";
        my $data = "";
        my $signatureVersion = $parameters->{SignatureVersion};
        if ("0" eq $signatureVersion) {
            $data =  $self->_calculateStringToSignV0($parameters);
        } elsif ("1" eq $signatureVersion) {
            $data = $self->_calculateStringToSignV1($parameters);
        } elsif ("2" eq $signatureVersion) {
            $algorithm = $self->{_config}->{SignatureMethod};
            $parameters->{SignatureMethod} = $algorithm;
            $data = $self->_calculateStringToSignV2($parameters);
        } else {
            Carp::croak ("Invalid Signature Version specified");
        }
        return $self->_sign($data, $key, $algorithm);
    }


    sub _calculateStringToSignV0 {
        my ($self, $parameters)  = @_;
        return $parameters->{Action} .  $parameters->{Timestamp};
    }


    sub _calculateStringToSignV1 {
        my ($self, $parameters)  = @_;
        my $data = "";
        foreach my $parameterName (sort { lc($a) cmp lc($b) } keys %$parameters) {
            no warnings "uninitialized";
        	$data .= $parameterName . $parameters->{$parameterName};
        }
        return $data;
    }

    sub _calculateStringToSignV2  {
        my ($self, $parameters)  = @_;
        my $endpoint = URI->new ($self->{_config}->{ServiceURL});
        my $data = "POST";
        $data .= "\n";
        $data .= $endpoint->host;
        $data .= "\n";
        my $path =  $endpoint->path || "/";
        $data .= $self->_urlencode($path, 1);
        $data .= "\n";
        my @parameterKeys =   keys %$parameters;
        foreach my $parameterName (sort { $a cmp $b } @parameterKeys ) {
            no warnings "uninitialized";
            $data .= $parameterName .  "="  . $self->_urlencode($parameters->{$parameterName});
            $data .= "&";
        }
        chop ($data);
        return $data;
    }

    sub _urlencode {
	my ($self, $value, $path) = @_;
	use URI::Escape qw(uri_escape_utf8);
	my $escapepattern = "^A-Za-z0-9\-_.~";
	if ($path) {
	    $escapepattern = $escapepattern .  "/";
	}
	return uri_escape_utf8($value, $escapepattern);
    }

    #
    # Computes RFC 2104-compliant HMAC signature.
    #
    sub  _sign {
        my ($self, $data, $key, $algorithm) = @_;
        my $output = "";
        if ("HmacSHA1" eq $algorithm) {
           $output  =  hmac_sha1_base64 ($data, $key);
        } elsif ("HmacSHA256" eq $algorithm) {
            $output = hmac_sha256_base64 ($data, $key);
        } else {
         	Carp::croak ("Non-supported signing method specified");
        }
        return $output . "=";
    }

    #
    # Formats date as ISO 8601 timestamp
    #
    sub _getFormattedTimestamp {
        return sprintf("%04d-%02d-%02dT%02d:%02d:%02d.000Z",
        sub {    ($_[5]+1900,
                 $_[4]+1,
                 $_[3],
                 $_[2],
                 $_[1],
                 $_[0])
           }->(gmtime(time)));
    }

                                                
    #
    # Convert ListMetricsRequest to name value pairs
    #
    sub _convertListMetrics() {
        my ($self, $request) = @_;
        
        my $parameters = {};
        $parameters->{"Action"} = "ListMetrics";
        if ($request->isSetNextToken()) {
            $parameters->{"NextToken"} =  $request->getNextToken();
        }

        return $parameters;
    }
        
                                                
    #
    # Convert GetMetricStatisticsRequest to name value pairs
    #
    sub _convertGetMetricStatistics() {
        my ($self, $request) = @_;
        
        my $parameters = {};
        $parameters->{"Action"} = "GetMetricStatistics";
        my $statisticsgetMetricStatisticsRequestList = $request->getStatistics();
        for my $statisticsgetMetricStatisticsRequestIndex (0 .. $#{$statisticsgetMetricStatisticsRequestList}) {
            my $statisticsgetMetricStatisticsRequest = $statisticsgetMetricStatisticsRequestList->[$statisticsgetMetricStatisticsRequestIndex];
            $parameters->{"Statistics" . ".member."  . ($statisticsgetMetricStatisticsRequestIndex + 1)} =  $statisticsgetMetricStatisticsRequest;
        }
        if ($request->isSetPeriod()) {
            $parameters->{"Period"} =  $request->getPeriod();
        }
        if ($request->isSetMeasureName()) {
            $parameters->{"MeasureName"} =  $request->getMeasureName();
        }
        my $dimensionsgetMetricStatisticsRequestList = $request->getDimensions();
        for my $dimensionsgetMetricStatisticsRequestIndex (0 .. $#{$dimensionsgetMetricStatisticsRequestList}) {
            my $dimensionsgetMetricStatisticsRequest = $dimensionsgetMetricStatisticsRequestList->[$dimensionsgetMetricStatisticsRequestIndex];
            if ($dimensionsgetMetricStatisticsRequest->isSetName()) {
                $parameters->{"Dimensions" . ".member."  . ($dimensionsgetMetricStatisticsRequestIndex + 1) . "." . "Name"} =  $dimensionsgetMetricStatisticsRequest->getName();
            }
            if ($dimensionsgetMetricStatisticsRequest->isSetValue()) {
                $parameters->{"Dimensions" . ".member."  . ($dimensionsgetMetricStatisticsRequestIndex + 1) . "." . "Value"} =  $dimensionsgetMetricStatisticsRequest->getValue();
            }

        }
        if ($request->isSetStartTime()) {
            $parameters->{"StartTime"} =  $request->getStartTime();
        }
        if ($request->isSetEndTime()) {
            $parameters->{"EndTime"} =  $request->getEndTime();
        }
        if ($request->isSetUnit()) {
            $parameters->{"Unit"} =  $request->getUnit();
        }
        if ($request->isSetCustomUnit()) {
            $parameters->{"CustomUnit"} =  $request->getCustomUnit();
        }
        if ($request->isSetNamespace()) {
            $parameters->{"Namespace"} =  $request->getNamespace();
        }

        return $parameters;
    }
        
                                                
1;

