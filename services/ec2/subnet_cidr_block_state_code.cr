private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SubnetCidrBlockStateCode
    Associating
    Associated
    Disassociating
    Disassociated
    Failing
    Failed

    def self.to_json(e : SubnetCidrBlockStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::SubnetCidrBlockStateCode::Associating    then "associating"
              when AEC::SubnetCidrBlockStateCode::Associated     then "associated"
              when AEC::SubnetCidrBlockStateCode::Disassociating then "disassociating"
              when AEC::SubnetCidrBlockStateCode::Disassociated  then "disassociated"
              when AEC::SubnetCidrBlockStateCode::Failing        then "failing"
              when AEC::SubnetCidrBlockStateCode::Failed         then "failed"
              else
                raise Exception.new("unknown enum value for 'SubnetCidrBlockStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SubnetCidrBlockStateCode
      value = pull.read_string
      case value
      when "associating"    then AEC::SubnetCidrBlockStateCode::Associating
      when "associated"     then AEC::SubnetCidrBlockStateCode::Associated
      when "disassociating" then AEC::SubnetCidrBlockStateCode::Disassociating
      when "disassociated"  then AEC::SubnetCidrBlockStateCode::Disassociated
      when "failing"        then AEC::SubnetCidrBlockStateCode::Failing
      when "failed"         then AEC::SubnetCidrBlockStateCode::Failed
      else
        raise Exception.new("unknown enum value for 'SubnetCidrBlockStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SubnetCidrBlockStateCode::Associating    then "associating"
      when AEC::SubnetCidrBlockStateCode::Associated     then "associated"
      when AEC::SubnetCidrBlockStateCode::Disassociating then "disassociating"
      when AEC::SubnetCidrBlockStateCode::Disassociated  then "disassociated"
      when AEC::SubnetCidrBlockStateCode::Failing        then "failing"
      when AEC::SubnetCidrBlockStateCode::Failed         then "failed"
      else
        raise Exception.new("unknown enum value for 'SubnetCidrBlockStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SubnetCidrBlockStateCode?
      case key
      when "associating"    then AEC::SubnetCidrBlockStateCode::Associating
      when "associated"     then AEC::SubnetCidrBlockStateCode::Associated
      when "disassociating" then AEC::SubnetCidrBlockStateCode::Disassociating
      when "disassociated"  then AEC::SubnetCidrBlockStateCode::Disassociated
      when "failing"        then AEC::SubnetCidrBlockStateCode::Failing
      when "failed"         then AEC::SubnetCidrBlockStateCode::Failed
      else
        nil
      end
    end
  end
end
