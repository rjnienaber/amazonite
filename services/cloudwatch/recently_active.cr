private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum RecentlyActive
    Pt3h

    def self.to_json(e : RecentlyActive, json : JSON::Builder) : Nil
      value = case e
              when ACW::RecentlyActive::Pt3h then "PT3H"
              else
                raise Exception.new("unknown enum value for 'RecentlyActive' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::RecentlyActive
      value = pull.read_string
      case value
      when "PT3H" then ACW::RecentlyActive::Pt3h
      else
        raise Exception.new("unknown enum value for 'RecentlyActive' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::RecentlyActive::Pt3h then "PT3H"
      else
        raise Exception.new("unknown enum value for 'RecentlyActive' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::RecentlyActive?
      case key
      when "PT3H" then ACW::RecentlyActive::Pt3h
      else
        nil
      end
    end
  end
end
