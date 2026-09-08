private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FpgaImageAttributeName
    Description
    Name
    LoadPermission
    ProductCodes

    def self.to_json(e : FpgaImageAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::FpgaImageAttributeName::Description    then "description"
              when AEC::FpgaImageAttributeName::Name           then "name"
              when AEC::FpgaImageAttributeName::LoadPermission then "loadPermission"
              when AEC::FpgaImageAttributeName::ProductCodes   then "productCodes"
              else
                raise Exception.new("unknown enum value for 'FpgaImageAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FpgaImageAttributeName
      value = pull.read_string
      case value
      when "description"    then AEC::FpgaImageAttributeName::Description
      when "name"           then AEC::FpgaImageAttributeName::Name
      when "loadPermission" then AEC::FpgaImageAttributeName::LoadPermission
      when "productCodes"   then AEC::FpgaImageAttributeName::ProductCodes
      else
        raise Exception.new("unknown enum value for 'FpgaImageAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FpgaImageAttributeName::Description    then "description"
      when AEC::FpgaImageAttributeName::Name           then "name"
      when AEC::FpgaImageAttributeName::LoadPermission then "loadPermission"
      when AEC::FpgaImageAttributeName::ProductCodes   then "productCodes"
      else
        raise Exception.new("unknown enum value for 'FpgaImageAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FpgaImageAttributeName?
      case key
      when "description"    then AEC::FpgaImageAttributeName::Description
      when "name"           then AEC::FpgaImageAttributeName::Name
      when "loadPermission" then AEC::FpgaImageAttributeName::LoadPermission
      when "productCodes"   then AEC::FpgaImageAttributeName::ProductCodes
      else
        nil
      end
    end
  end
end
