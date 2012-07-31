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



#
# List Metrics  Sample
#

use strict;
use Carp qw( carp croak );

# this is only needed when samples are running from directory
# not included in the @INC path
use lib qw(../../../.);  


 #***********************************************************************
 # Access Key ID and Secret Acess Key ID, obtained from:
 # http://aws.amazon.com
 #**********************************************************************/
 
 my $AWS_ACCESS_KEY_ID        = "<Your Access Key ID>";
 my $AWS_SECRET_ACCESS_KEY    = "<Your Secret Access Key>";

 #***********************************************************************
 # Instantiate Http Client Implementation of Cloud Watch 
 #**********************************************************************/
 use Amazon::CloudWatch::Client; 
 my $service = Amazon::CloudWatch::Client->new($AWS_ACCESS_KEY_ID, $AWS_SECRET_ACCESS_KEY);
 
 #************************************************************************
 # Uncomment to try out Mock Service that simulates Amazon::CloudWatch
 # responses without calling Amazon::CloudWatch service.
 #
 # Responses are loaded from local XML files. You can tweak XML files to
 # experiment with various outputs during development
 #
 # XML files available under Amazon/CloudWatch/Mock tree
 #
 #**********************************************************************/
 # use Amazon::CloudWatch::Mock;  
 # my $service = Amazon::CloudWatch::Mock->new;

 #************************************************************************
 # Setup request parameters and uncomment invoke to try out 
 # sample for List Metrics Action
 #**********************************************************************/
 use Amazon::CloudWatch::Model::ListMetricsRequest;
 # @TODO: set request. Action can be passed as Amazon::CloudWatch::Model::ListMetricsRequest
 # object or hash of parameters
 # invokeListMetrics($service, $request);

                
    # 
    # List Metrics Action Sample
    #
  sub invokeListMetrics {
      my ($service, $request) = @_;  
      eval {
              my $response = $service->listMetrics($request);
              
                print ("Service Response\n");
                print ("=============================================================================\n");

                print("        ListMetricsResponse\n");
                if ($response->isSetListMetricsResult()) { 
                    print("            ListMetricsResult\n");
                    my $listMetricsResult = $response->getListMetricsResult();
                    my $metricsList = $listMetricsResult->getMetrics();
                    foreach (@$metricsList) {
                        my $metrics = $_;
                        print("                Metrics\n");
                        if ($metrics->isSetMeasureName()) 
                        {
                            print("                    MeasureName\n");
                            print("                        " . $metrics->getMeasureName() . "\n");
                        }
                        my $dimensionsList = $metrics->getDimensions();
                        foreach (@$dimensionsList) {
                            my $dimensions = $_;
                            print("                    Dimensions\n");
                            if ($dimensions->isSetName()) 
                            {
                                print("                        Name\n");
                                print("                            " . $dimensions->getName() . "\n");
                            }
                            if ($dimensions->isSetValue()) 
                            {
                                print("                        Value\n");
                                print("                            " . $dimensions->getValue() . "\n");
                            }
                        }
                        if ($metrics->isSetNamespace()) 
                        {
                            print("                    Namespace\n");
                            print("                        " . $metrics->getNamespace() . "\n");
                        }
                    }
                    if ($listMetricsResult->isSetNextToken()) 
                    {
                        print("                NextToken\n");
                        print("                    " . $listMetricsResult->getNextToken() . "\n");
                    }
                } 
                if ($response->isSetResponseMetadata()) { 
                    print("            ResponseMetadata\n");
                    my $responseMetadata = $response->getResponseMetadata();
                    if ($responseMetadata->isSetRequestId()) 
                    {
                        print("                RequestId\n");
                        print("                    " . $responseMetadata->getRequestId() . "\n");
                    }
                } 

           
     };
    my $ex = $@;
    if ($ex) {
        require Amazon::CloudWatch::Exception;
        if (ref $ex eq "Amazon::CloudWatch::Exception") {
            print("Caught Exception: " . $ex->getMessage() . "\n");
            print("Response Status Code: " . $ex->getStatusCode() . "\n");
            print("Error Code: " . $ex->getErrorCode() . "\n");
            print("Error Type: " . $ex->getErrorType() . "\n");
            print("Request ID: " . $ex->getRequestId() . "\n");
            print("XML: " . $ex->getXML() . "\n");
        } else {
            croak $@;
        }
    }
 }

        