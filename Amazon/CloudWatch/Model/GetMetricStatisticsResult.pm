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


package Amazon::CloudWatch::Model::GetMetricStatisticsResult;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::GetMetricStatisticsResult
    # 
    # Properties:
    #
    # 
    # Datapoints: Amazon::CloudWatch::Model::Datapoint
    # Label: string
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            Datapoints => {FieldValue => [], FieldType => ["Amazon::CloudWatch::Model::Datapoint"]},
            Label => { FieldValue => undef, FieldType => "string"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
    }

        sub getDatapoints {
        return shift->{_fields}->{Datapoints}->{FieldValue};
    }

    sub setDatapoints {
        my $self = shift;
        foreach my $datapoints (@_) {
            if (not $self->_isArrayRef($datapoints)) {
                $datapoints =  [$datapoints];    
            }
            $self->{_fields}->{Datapoints}->{FieldValue} = $datapoints;
        }
    }


    sub withDatapoints {
        my ($self, $datapointsArgs) = @_;
        foreach my $datapoints (@$datapointsArgs) {
            $self->{_fields}->{Datapoints}->{FieldValue} = $datapoints;
        }
        return $self;
    }   


    sub isSetDatapoints {
        return  scalar (@{shift->{_fields}->{Datapoints}->{FieldValue}}) > 0;
    }


    sub getLabel {
        return shift->{_fields}->{Label}->{FieldValue};
    }


    sub setLabel {
        my ($self, $value) = @_;

        $self->{_fields}->{Label}->{FieldValue} = $value;
        return $self;
    }


    sub withLabel {
        my ($self, $value) = @_;
        $self->setLabel($value);
        return $self;
    }


    sub isSetLabel {
        return defined (shift->{_fields}->{Label}->{FieldValue});
    }





1;