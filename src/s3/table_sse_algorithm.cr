private alias AS = Amazonite::S3

module Amazonite::S3
  enum TableSseAlgorithm
    AwsKms
    Aes256

    def self.to_json(e : TableSseAlgorithm, json : JSON::Builder) : Nil
      value = case e
              when AS::TableSseAlgorithm::AwsKms then "aws:kms"
              when AS::TableSseAlgorithm::Aes256 then "AES256"
              else
                raise Exception.new("unknown enum value for 'TableSseAlgorithm' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::TableSseAlgorithm
      value = pull.read_string
      case value
      when "aws:kms" then AS::TableSseAlgorithm::AwsKms
      when "AES256"  then AS::TableSseAlgorithm::Aes256
      else
        raise Exception.new("unknown enum value for 'TableSseAlgorithm' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::TableSseAlgorithm::AwsKms then "aws:kms"
      when AS::TableSseAlgorithm::Aes256 then "AES256"
      else
        raise Exception.new("unknown enum value for 'TableSseAlgorithm' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::TableSseAlgorithm?
      case key
      when "aws:kms" then AS::TableSseAlgorithm::AwsKms
      when "AES256"  then AS::TableSseAlgorithm::Aes256
      else
        nil
      end
    end
  end
end
