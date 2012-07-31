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


package Amazon::CloudWatch::Model::Metric;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::Metric
    # 
    # Properties:
    #
    # 
    # MeasureName: string
    # Dimensions: Amazon::CloudWatch::Model::Dimension
    # Namespace: string
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            MeasureName => { FieldValue => undef, FieldType => "string"},
            Dimensions => {FieldValue => [], FieldType => ["Amazon::CloudWatch::Model::Dimension"]},
            Namespace => { FieldValue => undef, FieldType => "string"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
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