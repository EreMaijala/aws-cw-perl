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



package  Amazon::CloudWatch::Mock;
{
   # Public API ------------------------------------------------------------#
    sub new {
        my ($class, $awsAccessKeyId, $awsSecretAccessKey, $config) = @_;
        my $defaultConfig =  {
                            ServiceURL => "https://monitoring.amazonaws.com",
                            UserAgent => "Amazon CloudWatch Perl Library",
                            SignatureVersion => 1,
                            ProxyHost => undef,
                            ProxyPort => -1,
                            MaxErrorRetry => 3
                          };
        my $self = {};
        $self->{_awsAccessKeyId} = $awsAccessKeyId;
        $self->{_awsSecretAccessKey} = $awsSecretAccessKey;
        $self->{_config} = $defaultConfig;
        $self->{_config} = {%$defaultConfig, %$config} if defined ($config);

        return bless ($self, $class);
    }

        
    sub listMetrics {
        require Amazon::CloudWatch::Model::ListMetricsResponse;
        return Amazon::CloudWatch::Model::ListMetricsResponse
                    ->fromXML ($INC{"Amazon/CloudWatch/Mock/ListMetricsResponse.xml"});
    }


        
    sub getMetricStatistics {
        require Amazon::CloudWatch::Model::GetMetricStatisticsResponse;
        return Amazon::CloudWatch::Model::GetMetricStatisticsResponse
                    ->fromXML ($INC{"Amazon/CloudWatch/Mock/GetMetricStatisticsResponse.xml"});
    }

}

1;