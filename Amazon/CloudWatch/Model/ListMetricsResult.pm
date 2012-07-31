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


package Amazon::CloudWatch::Model::ListMetricsResult;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::ListMetricsResult
    # 
    # Properties:
    #
    # 
    # Metrics: Amazon::CloudWatch::Model::Metric
    # NextToken: string
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            Metrics => {FieldValue => [], FieldType => ["Amazon::CloudWatch::Model::Metric"]},
            NextToken => { FieldValue => undef, FieldType => "string"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
    }

        sub getMetrics {
        return shift->{_fields}->{Metrics}->{FieldValue};
    }

    sub setMetrics {
        my $self = shift;
        foreach my $metrics (@_) {
            if (not $self->_isArrayRef($metrics)) {
                $metrics =  [$metrics];    
            }
            $self->{_fields}->{Metrics}->{FieldValue} = $metrics;
        }
    }


    sub withMetrics {
        my ($self, $metricsArgs) = @_;
        foreach my $metrics (@$metricsArgs) {
            $self->{_fields}->{Metrics}->{FieldValue} = $metrics;
        }
        return $self;
    }   


    sub isSetMetrics {
        return  scalar (@{shift->{_fields}->{Metrics}->{FieldValue}}) > 0;
    }


    sub getNextToken {
        return shift->{_fields}->{NextToken}->{FieldValue};
    }


    sub setNextToken {
        my ($self, $value) = @_;

        $self->{_fields}->{NextToken}->{FieldValue} = $value;
        return $self;
    }


    sub withNextToken {
        my ($self, $value) = @_;
        $self->setNextToken($value);
        return $self;
    }


    sub isSetNextToken {
        return defined (shift->{_fields}->{NextToken}->{FieldValue});
    }





1;