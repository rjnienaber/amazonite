private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ApplyCancellationCharges
    CommitmentWindDown

    def self.to_json(e : ApplyCancellationCharges, json : JSON::Builder) : Nil
      value = case e
              when AEC::ApplyCancellationCharges::CommitmentWindDown then "commitment-wind-down"
              else
                raise Exception.new("unknown enum value for 'ApplyCancellationCharges' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ApplyCancellationCharges
      value = pull.read_string
      case value
      when "commitment-wind-down" then AEC::ApplyCancellationCharges::CommitmentWindDown
      else
        raise Exception.new("unknown enum value for 'ApplyCancellationCharges' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ApplyCancellationCharges::CommitmentWindDown then "commitment-wind-down"
      else
        raise Exception.new("unknown enum value for 'ApplyCancellationCharges' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ApplyCancellationCharges?
      case key
      when "commitment-wind-down" then AEC::ApplyCancellationCharges::CommitmentWindDown
      else
        nil
      end
    end
  end
end
