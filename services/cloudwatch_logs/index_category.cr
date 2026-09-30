private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum IndexCategory
    Default
    Custom
    Auto
    Inactive

    def self.to_json(e : IndexCategory, json : JSON::Builder) : Nil
      value = case e
              when ACWL::IndexCategory::Default  then "DEFAULT"
              when ACWL::IndexCategory::Custom   then "CUSTOM"
              when ACWL::IndexCategory::Auto     then "AUTO"
              when ACWL::IndexCategory::Inactive then "INACTIVE"
              else
                raise Exception.new("unknown enum value for 'IndexCategory' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::IndexCategory
      value = pull.read_string
      case value
      when "DEFAULT"  then ACWL::IndexCategory::Default
      when "CUSTOM"   then ACWL::IndexCategory::Custom
      when "AUTO"     then ACWL::IndexCategory::Auto
      when "INACTIVE" then ACWL::IndexCategory::Inactive
      else
        raise Exception.new("unknown enum value for 'IndexCategory' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::IndexCategory::Default  then "DEFAULT"
      when ACWL::IndexCategory::Custom   then "CUSTOM"
      when ACWL::IndexCategory::Auto     then "AUTO"
      when ACWL::IndexCategory::Inactive then "INACTIVE"
      else
        raise Exception.new("unknown enum value for 'IndexCategory' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::IndexCategory?
      case key
      when "DEFAULT"  then ACWL::IndexCategory::Default
      when "CUSTOM"   then ACWL::IndexCategory::Custom
      when "AUTO"     then ACWL::IndexCategory::Auto
      when "INACTIVE" then ACWL::IndexCategory::Inactive
      else
        nil
      end
    end
  end
end
