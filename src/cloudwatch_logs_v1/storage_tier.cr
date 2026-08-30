private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum StorageTier
    Standard
    IntelligentTiering

    def self.to_json(e : StorageTier, json : JSON::Builder) : Nil
      value = case e
              when ACWL::StorageTier::Standard           then "STANDARD"
              when ACWL::StorageTier::IntelligentTiering then "INTELLIGENT_TIERING"
              else
                raise Exception.new("unknown enum value for 'StorageTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::StorageTier
      value = pull.read_string
      case value
      when "STANDARD"            then ACWL::StorageTier::Standard
      when "INTELLIGENT_TIERING" then ACWL::StorageTier::IntelligentTiering
      else
        raise Exception.new("unknown enum value for 'StorageTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::StorageTier::Standard           then "STANDARD"
      when ACWL::StorageTier::IntelligentTiering then "INTELLIGENT_TIERING"
      else
        raise Exception.new("unknown enum value for 'StorageTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::StorageTier?
      case key
      when "STANDARD"            then ACWL::StorageTier::Standard
      when "INTELLIGENT_TIERING" then ACWL::StorageTier::IntelligentTiering
      else
        nil
      end
    end
  end
end
