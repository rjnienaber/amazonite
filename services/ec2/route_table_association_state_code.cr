private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteTableAssociationStateCode
    Associating
    Associated
    Disassociating
    Disassociated
    Failed

    def self.to_json(e : RouteTableAssociationStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteTableAssociationStateCode::Associating    then "associating"
              when AEC::RouteTableAssociationStateCode::Associated     then "associated"
              when AEC::RouteTableAssociationStateCode::Disassociating then "disassociating"
              when AEC::RouteTableAssociationStateCode::Disassociated  then "disassociated"
              when AEC::RouteTableAssociationStateCode::Failed         then "failed"
              else
                raise Exception.new("unknown enum value for 'RouteTableAssociationStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteTableAssociationStateCode
      value = pull.read_string
      case value
      when "associating"    then AEC::RouteTableAssociationStateCode::Associating
      when "associated"     then AEC::RouteTableAssociationStateCode::Associated
      when "disassociating" then AEC::RouteTableAssociationStateCode::Disassociating
      when "disassociated"  then AEC::RouteTableAssociationStateCode::Disassociated
      when "failed"         then AEC::RouteTableAssociationStateCode::Failed
      else
        raise Exception.new("unknown enum value for 'RouteTableAssociationStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteTableAssociationStateCode::Associating    then "associating"
      when AEC::RouteTableAssociationStateCode::Associated     then "associated"
      when AEC::RouteTableAssociationStateCode::Disassociating then "disassociating"
      when AEC::RouteTableAssociationStateCode::Disassociated  then "disassociated"
      when AEC::RouteTableAssociationStateCode::Failed         then "failed"
      else
        raise Exception.new("unknown enum value for 'RouteTableAssociationStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteTableAssociationStateCode?
      case key
      when "associating"    then AEC::RouteTableAssociationStateCode::Associating
      when "associated"     then AEC::RouteTableAssociationStateCode::Associated
      when "disassociating" then AEC::RouteTableAssociationStateCode::Disassociating
      when "disassociated"  then AEC::RouteTableAssociationStateCode::Disassociated
      when "failed"         then AEC::RouteTableAssociationStateCode::Failed
      else
        nil
      end
    end
  end
end
