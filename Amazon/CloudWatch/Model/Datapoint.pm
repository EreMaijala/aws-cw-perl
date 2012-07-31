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


package Amazon::CloudWatch::Model::Datapoint;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::Datapoint
    # 
    # Properties:
    #
    # 
    # Timestamp: string
    # Samples: int
    # Average: int
    # Sum: int
    # Minimum: int
    # Maximum: int
    # Unit: string
    # CustomUnit: string
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            Timestamp => { FieldValue => undef, FieldType => "string"},
            Samples => { FieldValue => undef, FieldType => "int"},
            Average => { FieldValue => undef, FieldType => "int"},
            Sum => { FieldValue => undef, FieldType => "int"},
            Minimum => { FieldValue => undef, FieldType => "int"},
            Maximum => { FieldValue => undef, FieldType => "int"},
            Unit => { FieldValue => undef, FieldType => "string"},
            CustomUnit => { FieldValue => undef, FieldType => "string"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
    }

    
    sub getTimestamp {
        return shift->{_fields}->{Timestamp}->{FieldValue};
    }


    sub setTimestamp {
        my ($self, $value) = @_;

        $self->{_fields}->{Timestamp}->{FieldValue} = $value;
        return $self;
    }


    sub withTimestamp {
        my ($self, $value) = @_;
        $self->setTimestamp($value);
        return $self;
    }


    sub isSetTimestamp {
        return defined (shift->{_fields}->{Timestamp}->{FieldValue});
    }


    sub getSamples {
        return shift->{_fields}->{Samples}->{FieldValue};
    }


    sub setSamples {
        my ($self, $value) = @_;

        $self->{_fields}->{Samples}->{FieldValue} = $value;
        return $self;
    }


    sub withSamples {
        my ($self, $value) = @_;
        $self->setSamples($value);
        return $self;
    }


    sub isSetSamples {
        return defined (shift->{_fields}->{Samples}->{FieldValue});
    }


    sub getAverage {
        return shift->{_fields}->{Average}->{FieldValue};
    }


    sub setAverage {
        my ($self, $value) = @_;

        $self->{_fields}->{Average}->{FieldValue} = $value;
        return $self;
    }


    sub withAverage {
        my ($self, $value) = @_;
        $self->setAverage($value);
        return $self;
    }


    sub isSetAverage {
        return defined (shift->{_fields}->{Average}->{FieldValue});
    }


    sub getSum {
        return shift->{_fields}->{Sum}->{FieldValue};
    }


    sub setSum {
        my ($self, $value) = @_;

        $self->{_fields}->{Sum}->{FieldValue} = $value;
        return $self;
    }


    sub withSum {
        my ($self, $value) = @_;
        $self->setSum($value);
        return $self;
    }


    sub isSetSum {
        return defined (shift->{_fields}->{Sum}->{FieldValue});
    }


    sub getMinimum {
        return shift->{_fields}->{Minimum}->{FieldValue};
    }


    sub setMinimum {
        my ($self, $value) = @_;

        $self->{_fields}->{Minimum}->{FieldValue} = $value;
        return $self;
    }


    sub withMinimum {
        my ($self, $value) = @_;
        $self->setMinimum($value);
        return $self;
    }


    sub isSetMinimum {
        return defined (shift->{_fields}->{Minimum}->{FieldValue});
    }


    sub getMaximum {
        return shift->{_fields}->{Maximum}->{FieldValue};
    }


    sub setMaximum {
        my ($self, $value) = @_;

        $self->{_fields}->{Maximum}->{FieldValue} = $value;
        return $self;
    }


    sub withMaximum {
        my ($self, $value) = @_;
        $self->setMaximum($value);
        return $self;
    }


    sub isSetMaximum {
        return defined (shift->{_fields}->{Maximum}->{FieldValue});
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





1;