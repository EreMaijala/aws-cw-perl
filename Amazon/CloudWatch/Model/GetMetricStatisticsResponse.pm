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


package Amazon::CloudWatch::Model::GetMetricStatisticsResponse;

use base qw (Amazon::CloudWatch::Model);

    

    #
    # Amazon::CloudWatch::Model::GetMetricStatisticsResponse
    # 
    # Properties:
    #
    # 
    # ResponseMetadata: Amazon::CloudWatch::Model::ResponseMetadata
    # GetMetricStatisticsResult: Amazon::CloudWatch::Model::GetMetricStatisticsResult
    #
    # 
    # 
    sub new {
        my ($class, $data) = @_;
        my $self = {};
        $self->{_fields} = {
            
            ResponseMetadata => {FieldValue => undef, FieldType => "Amazon::CloudWatch::Model::ResponseMetadata"},
            GetMetricStatisticsResult => {FieldValue => undef, FieldType => "Amazon::CloudWatch::Model::GetMetricStatisticsResult"},
        };

        bless ($self, $class);
        if (defined $data) {
           $self->_fromHashRef($data); 
        }
        
        return $self;
    }

       
     #
     # Construct Amazon::CloudWatch::Model::GetMetricStatisticsResponse from XML string
     # 
    sub fromXML {
        my ($self, $xml) = @_;
        eval "use XML::Simple";
        my $tree = XML::Simple::XMLin ($xml);
         
        # TODO: check valid XML (is this a response XML?)
        
        return new Amazon::CloudWatch::Model::GetMetricStatisticsResponse($tree);
          
    }
    
    sub getResponseMetadata {
        return shift->{_fields}->{ResponseMetadata}->{FieldValue};
    }


    sub setResponseMetadata {
        my ($self, $value) = @_;
        $self->{_fields}->{ResponseMetadata}->{FieldValue} = $value;
    }


    sub withResponseMetadata {
        my ($self, $value) = @_;
        $self->setResponseMetadata($value);
        return $self;
    }


    sub isSetResponseMetadata {
        return defined (shift->{_fields}->{ResponseMetadata}->{FieldValue});

    }

    sub getGetMetricStatisticsResult {
        return shift->{_fields}->{GetMetricStatisticsResult}->{FieldValue};
    }


    sub setGetMetricStatisticsResult {
        my ($self, $value) = @_;
        $self->{_fields}->{GetMetricStatisticsResult}->{FieldValue} = $value;
    }


    sub withGetMetricStatisticsResult {
        my ($self, $value) = @_;
        $self->setGetMetricStatisticsResult($value);
        return $self;
    }


    sub isSetGetMetricStatisticsResult {
        return defined (shift->{_fields}->{GetMetricStatisticsResult}->{FieldValue});

    }



    #
    # XML Representation for this object
    # 
    # Returns string XML for this object
    #
    sub toXML {
        my $self = shift;
        my $xml = "";
        $xml .= "<GetMetricStatisticsResponse xmlns=\"http://monitoring.amazonaws.com/doc/2009-05-15/\">";
        $xml .= $self->_toXMLFragment();
        $xml .= "</GetMetricStatisticsResponse>";
        return $xml;
    }


1;