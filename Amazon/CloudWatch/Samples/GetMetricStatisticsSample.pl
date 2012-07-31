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
# Get Metric Statistics  Sample
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
 # sample for Get Metric Statistics Action
 #**********************************************************************/
 use Amazon::CloudWatch::Model::GetMetricStatisticsRequest;
 # @TODO: set request. Action can be passed as Amazon::CloudWatch::Model::GetMetricStatisticsRequest
 # object or hash of parameters
 # invokeGetMetricStatistics($service, $request);

                    
    # 
    # Get Metric Statistics Action Sample
    #
  sub invokeGetMetricStatistics {
      my ($service, $request) = @_;  
      eval {
              my $response = $service->getMetricStatistics($request);
              
                print ("Service Response\n");
                print ("=============================================================================\n");

                print("        GetMetricStatisticsResponse\n");
                if ($response->isSetResponseMetadata()) { 
                    print("            ResponseMetadata\n");
                    my $responseMetadata = $response->getResponseMetadata();
                    if ($responseMetadata->isSetRequestId()) 
                    {
                        print("                RequestId\n");
                        print("                    " . $responseMetadata->getRequestId() . "\n");
                    }
                } 
                if ($response->isSetGetMetricStatisticsResult()) { 
                    print("            GetMetricStatisticsResult\n");
                    my $getMetricStatisticsResult = $response->getGetMetricStatisticsResult();
                    my $datapointsList = $getMetricStatisticsResult->getDatapoints();
                    foreach (@$datapointsList) {
                        my $datapoints = $_;
                        print("                Datapoints\n");
                        if ($datapoints->isSetTimestamp()) 
                        {
                            print("                    Timestamp\n");
                            print("                        " . $datapoints->getTimestamp() . "\n");
                        }
                        if ($datapoints->isSetSamples()) 
                        {
                            print("                    Samples\n");
                            print("                        " . $datapoints->getSamples() . "\n");
                        }
                        if ($datapoints->isSetAverage()) 
                        {
                            print("                    Average\n");
                            print("                        " . $datapoints->getAverage() . "\n");
                        }
                        if ($datapoints->isSetSum()) 
                        {
                            print("                    Sum\n");
                            print("                        " . $datapoints->getSum() . "\n");
                        }
                        if ($datapoints->isSetMinimum()) 
                        {
                            print("                    Minimum\n");
                            print("                        " . $datapoints->getMinimum() . "\n");
                        }
                        if ($datapoints->isSetMaximum()) 
                        {
                            print("                    Maximum\n");
                            print("                        " . $datapoints->getMaximum() . "\n");
                        }
                        if ($datapoints->isSetUnit()) 
                        {
                            print("                    Unit\n");
                            print("                        " . $datapoints->getUnit() . "\n");
                        }
                        if ($datapoints->isSetCustomUnit()) 
                        {
                            print("                    CustomUnit\n");
                            print("                        " . $datapoints->getCustomUnit() . "\n");
                        }
                    }
                    if ($getMetricStatisticsResult->isSetLabel()) 
                    {
                        print("                Label\n");
                        print("                    " . $getMetricStatisticsResult->getLabel() . "\n");
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

    