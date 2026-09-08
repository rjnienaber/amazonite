private alias AS = Amazonite::S3

module Amazonite::S3
  enum MFADelete
    Enabled
    Disabled

    def self.to_json(e : MFADelete, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MFADelete
      value = pull.read_string
      case value
      when "Enabled"  then AS::MFADelete::Enabled
      when "Disabled" then AS::MFADelete::Disabled
      else
        raise Exception.new("unknown enum value for 'MFADelete' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::MFADelete?
      case key
      when "Enabled"  then AS::MFADelete::Enabled
      when "Disabled" then AS::MFADelete::Disabled
      else
        nil
      end
    end
  end
end
