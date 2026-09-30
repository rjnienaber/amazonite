private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum FlattenedElement
    First
    Last

    def self.to_json(e : FlattenedElement, json : JSON::Builder) : Nil
      value = case e
              when ACWL::FlattenedElement::First then "first"
              when ACWL::FlattenedElement::Last  then "last"
              else
                raise Exception.new("unknown enum value for 'FlattenedElement' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::FlattenedElement
      value = pull.read_string
      case value
      when "first" then ACWL::FlattenedElement::First
      when "last"  then ACWL::FlattenedElement::Last
      else
        raise Exception.new("unknown enum value for 'FlattenedElement' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::FlattenedElement::First then "first"
      when ACWL::FlattenedElement::Last  then "last"
      else
        raise Exception.new("unknown enum value for 'FlattenedElement' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::FlattenedElement?
      case key
      when "first" then ACWL::FlattenedElement::First
      when "last"  then ACWL::FlattenedElement::Last
      else
        nil
      end
    end
  end
end
