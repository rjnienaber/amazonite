private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondaryNetworkType
    Rdma

    def self.to_json(e : SecondaryNetworkType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondaryNetworkType::Rdma then "rdma"
              else
                raise Exception.new("unknown enum value for 'SecondaryNetworkType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondaryNetworkType
      value = pull.read_string
      case value
      when "rdma" then AEC::SecondaryNetworkType::Rdma
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondaryNetworkType::Rdma then "rdma"
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondaryNetworkType?
      case key
      when "rdma" then AEC::SecondaryNetworkType::Rdma
      else
        nil
      end
    end
  end
end
