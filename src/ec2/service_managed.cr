private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ServiceManaged
    Alb
    Nlb
    Rnat
    Rds

    def self.to_json(e : ServiceManaged, json : JSON::Builder) : Nil
      value = case e
              when AEC::ServiceManaged::Alb  then "alb"
              when AEC::ServiceManaged::Nlb  then "nlb"
              when AEC::ServiceManaged::Rnat then "rnat"
              when AEC::ServiceManaged::Rds  then "rds"
              else
                raise Exception.new("unknown enum value for 'ServiceManaged' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ServiceManaged
      value = pull.read_string
      case value
      when "alb"  then AEC::ServiceManaged::Alb
      when "nlb"  then AEC::ServiceManaged::Nlb
      when "rnat" then AEC::ServiceManaged::Rnat
      when "rds"  then AEC::ServiceManaged::Rds
      else
        raise Exception.new("unknown enum value for 'ServiceManaged' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ServiceManaged::Alb  then "alb"
      when AEC::ServiceManaged::Nlb  then "nlb"
      when AEC::ServiceManaged::Rnat then "rnat"
      when AEC::ServiceManaged::Rds  then "rds"
      else
        raise Exception.new("unknown enum value for 'ServiceManaged' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ServiceManaged?
      case key
      when "alb"  then AEC::ServiceManaged::Alb
      when "nlb"  then AEC::ServiceManaged::Nlb
      when "rnat" then AEC::ServiceManaged::Rnat
      when "rds"  then AEC::ServiceManaged::Rds
      else
        nil
      end
    end
  end
end
