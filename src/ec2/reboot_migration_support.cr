private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RebootMigrationSupport
    Unsupported
    Supported

    def self.to_json(e : RebootMigrationSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::RebootMigrationSupport::Unsupported then "unsupported"
              when AEC::RebootMigrationSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'RebootMigrationSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RebootMigrationSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::RebootMigrationSupport::Unsupported
      when "supported"   then AEC::RebootMigrationSupport::Supported
      else
        raise Exception.new("unknown enum value for 'RebootMigrationSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RebootMigrationSupport::Unsupported then "unsupported"
      when AEC::RebootMigrationSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'RebootMigrationSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RebootMigrationSupport?
      case key
      when "unsupported" then AEC::RebootMigrationSupport::Unsupported
      when "supported"   then AEC::RebootMigrationSupport::Supported
      else
        nil
      end
    end
  end
end
