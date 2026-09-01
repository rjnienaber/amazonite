private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum VersionBump
    Major
    Minor

    def self.to_json(e : VersionBump, json : JSON::Builder) : Nil
      value = case e
              when ACF::VersionBump::Major then "MAJOR"
              when ACF::VersionBump::Minor then "MINOR"
              else
                raise Exception.new("unknown enum value for 'VersionBump' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::VersionBump
      value = pull.read_string
      case value
      when "MAJOR" then ACF::VersionBump::Major
      when "MINOR" then ACF::VersionBump::Minor
      else
        raise Exception.new("unknown enum value for 'VersionBump' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::VersionBump::Major then "MAJOR"
      when ACF::VersionBump::Minor then "MINOR"
      else
        raise Exception.new("unknown enum value for 'VersionBump' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::VersionBump?
      case key
      when "MAJOR" then ACF::VersionBump::Major
      when "MINOR" then ACF::VersionBump::Minor
      else
        nil
      end
    end
  end
end
