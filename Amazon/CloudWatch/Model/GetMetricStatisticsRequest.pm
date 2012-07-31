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


package Amazon::CloudWatch::Model::GetMetricStatisticsRequest;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::GetMetricStatisticsRequest
    # 
    # Properties:
    #
    # 
    # Statistics: string
    # Period: int
    # MeasureName: string
    # Dimensions: Amazon::CloudWatch::Model::Dimension
    # StartTime: string
    # EndTime: string
    # Unit: string
    # CustomUnit: string
    # Namespace: string
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            Statistics => {FieldValue => [], FieldType => ["string"]},
            Period => { FieldValue => undef, FieldType => "int"},
            MeasureName => { FieldValue => undef, FieldType => "string"},
            Dimensions => {FieldValue => [], FieldType => ["Amazon::CloudWatch::Model::Dimension"]},
            StartTime => { FieldValue => undef, FieldType => "string"},
            EndTime => { FieldValue => undef, FieldType => "string"},
            Unit => { FieldValue => undef, FieldType => "string"},
            CustomUnit => { FieldValue => undef, FieldType => "string"},
            Namespace => { FieldValue => undef, FieldType => "string"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
    }

        sub getStatistics {
        return shift->{_fields}->{Statistics}->{FieldValue};
    }


    sub setStatistics    {
        my ($self, $value) = @_;
        $self->{_fields}->{Statistics}->{FieldValue} = $value;
        return $self;
    }



    sub withStatistics {
        my $self = shift;
            my $list = $self->{_fields}->{Statistics}->{FieldValue};
            for (@_) {
                push (@$list, $_);
            }
        return $self;
    }  
      

    sub isSetStatistics {
        return scalar (@{shift->{_fields}->{Statistics}->{FieldValue}}) > 0;
    }


    sub getPeriod {
        return shift->{_fields}->{Period}->{FieldValue};
    }


    sub setPeriod {
        my ($self, $value) = @_;

        $self->{_fields}->{Period}->{FieldValue} = $value;
        return $self;
    }


    sub withPeriod {
        my ($self, $value) = @_;
        $self->setPeriod($value);
        return $self;
    }


    sub isSetPeriod {
        return defined (shift->{_fields}->{Period}->{FieldValue});
    }


    sub getMeasureName {
        return shift->{_fields}->{MeasureName}->{FieldValue};
    }


    sub setMeasureName {
        my ($self, $value) = @_;

        $self->{_fields}->{MeasureName}->{FieldValue} = $value;
        return $self;
    }


    sub withMeasureName {
        my ($self, $value) = @_;
        $self->setMeasureName($value);
        return $self;
    }


    sub isSetMeasureName {
        return defined (shift->{_fields}->{MeasureName}->{FieldValue});
    }

    sub getDimensions {
        return shift->{_fields}->{Dimensions}->{FieldValue};
    }

    sub setDimensions {
        my $self = shift;
        foreach my $dimensions (@_) {
            if (not $self->_isArrayRef($dimensions)) {
                $dimensions =  [$dimensions];    
            }
            $self->{_fields}->{Dimensions}->{FieldValue} = $dimensions;
        }
    }


    sub withDimensions {
        my ($self, $dimensionsArgs) = @_;
        foreach my $dimensions (@$dimensionsArgs) {
            $self->{_fields}->{Dimensions}->{FieldValue} = $dimensions;
        }
        return $self;
    }   


    sub isSetDimensions {
        return  scalar (@{shift->{_fields}->{Dimensions}->{FieldValue}}) > 0;
    }


    sub getStartTime {
        return shift->{_fields}->{StartTime}->{FieldValue};
    }


    sub setStartTime {
        my ($self, $value) = @_;

        $self->{_fields}->{StartTime}->{FieldValue} = $value;
        return $self;
    }


    sub withStartTime {
        my ($self, $value) = @_;
        $self->setStartTime($value);
        return $self;
    }


    sub isSetStartTime {
        return defined (shift->{_fields}->{StartTime}->{FieldValue});
    }


    sub getEndTime {
        return shift->{_fields}->{EndTime}->{FieldValue};
    }


    sub setEndTime {
        my ($self, $value) = @_;

        $self->{_fields}->{EndTime}->{FieldValue} = $value;
        return $self;
    }


    sub withEndTime {
        my ($self, $value) = @_;
        $self->setEndTime($value);
        return $self;
    }


    sub isSetEndTime {
        return defined (shift->{_fields}->{EndTime}->{FieldValue});
    }


    sub getUnit {
        return shift->{_fields}->{Unit}->{FieldValue};
    }


    sub setUnit {
        my ($self, $value) = @_;

        $self->{_fields}->{Unit}->{FieldValue} = $value;
        return $self;
    }


    sub withUnit {
        my ($self, $value) = @_;
        $self->setUnit($value);
        return $self;
    }


    sub isSetUnit {
        return defined (shift->{_fields}->{Unit}->{FieldValue});
    }


    sub getCustomUnit {
        return shift->{_fields}->{CustomUnit}->{FieldValue};
    }


    sub setCustomUnit {
        my ($self, $value) = @_;

        $self->{_fields}->{CustomUnit}->{FieldValue} = $value;
        return $self;
    }


    sub withCustomUnit {
        my ($self, $value) = @_;
        $self->setCustomUnit($value);
        return $self;
    }


    sub isSetCustomUnit {
        return defined (shift->{_fields}->{CustomUnit}->{FieldValue});
    }


    sub getNamespace {
        return shift->{_fields}->{Namespace}->{FieldValue};
    }


    sub setNamespace {
        my ($self, $value) = @_;

        $self->{_fields}->{Namespace}->{FieldValue} = $value;
        return $self;
    }


    sub withNamespace {
        my ($self, $value) = @_;
        $self->setNamespace($value);
        return $self;
    }


    sub isSetNamespace {
        return defined (shift->{_fields}->{Namespace}->{FieldValue});
    }





1;