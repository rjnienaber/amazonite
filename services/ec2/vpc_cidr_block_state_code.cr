private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcCidrBlockStateCode
    Associating
    Associated
    Disassociating
    Disassociated
    Failing
    Failed

    def self.to_json(e : VpcCidrBlockStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcCidrBlockStateCode::Associating    then "associating"
              when AEC::VpcCidrBlockStateCode::Associated     then "associated"
              when AEC::VpcCidrBlockStateCode::Disassociating then "disassociating"
              when AEC::VpcCidrBlockStateCode::Disassociated  then "disassociated"
              when AEC::VpcCidrBlockStateCode::Failing        then "failing"
              when AEC::VpcCidrBlockStateCode::Failed         then "failed"
              else
                raise Exception.new("unknown enum value for 'VpcCidrBlockStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcCidrBlockStateCode
      value = pull.read_string
      case value
      when "associating"    then AEC::VpcCidrBlockStateCode::Associating
      when "associated"     then AEC::VpcCidrBlockStateCode::Associated
      when "disassociating" then AEC::VpcCidrBlockStateCode::Disassociating
      when "disassociated"  then AEC::VpcCidrBlockStateCode::Disassociated
      when "failing"        then AEC::VpcCidrBlockStateCode::Failing
      when "failed"         then AEC::VpcCidrBlockStateCode::Failed
      else
        raise Exception.new("unknown enum value for 'VpcCidrBlockStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcCidrBlockStateCode::Associating    then "associating"
      when AEC::VpcCidrBlockStateCode::Associated     then "associated"
      when AEC::VpcCidrBlockStateCode::Disassociating then "disassociating"
      when AEC::VpcCidrBlockStateCode::Disassociated  then "disassociated"
      when AEC::VpcCidrBlockStateCode::Failing        then "failing"
      when AEC::VpcCidrBlockStateCode::Failed         then "failed"
      else
        raise Exception.new("unknown enum value for 'VpcCidrBlockStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcCidrBlockStateCode?
      case key
      when "associating"    then AEC::VpcCidrBlockStateCode::Associating
      when "associated"     then AEC::VpcCidrBlockStateCode::Associated
      when "disassociating" then AEC::VpcCidrBlockStateCode::Disassociating
      when "disassociated"  then AEC::VpcCidrBlockStateCode::Disassociated
      when "failing"        then AEC::VpcCidrBlockStateCode::Failing
      when "failed"         then AEC::VpcCidrBlockStateCode::Failed
      else
        nil
      end
    end
  end
end
