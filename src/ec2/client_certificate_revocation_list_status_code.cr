private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientCertificateRevocationListStatusCode
    Pending
    Active

    def self.to_json(e : ClientCertificateRevocationListStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientCertificateRevocationListStatusCode::Pending then "pending"
              when AEC::ClientCertificateRevocationListStatusCode::Active  then "active"
              else
                raise Exception.new("unknown enum value for 'ClientCertificateRevocationListStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientCertificateRevocationListStatusCode
      value = pull.read_string
      case value
      when "pending" then AEC::ClientCertificateRevocationListStatusCode::Pending
      when "active"  then AEC::ClientCertificateRevocationListStatusCode::Active
      else
        raise Exception.new("unknown enum value for 'ClientCertificateRevocationListStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientCertificateRevocationListStatusCode::Pending then "pending"
      when AEC::ClientCertificateRevocationListStatusCode::Active  then "active"
      else
        raise Exception.new("unknown enum value for 'ClientCertificateRevocationListStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientCertificateRevocationListStatusCode?
      case key
      when "pending" then AEC::ClientCertificateRevocationListStatusCode::Pending
      when "active"  then AEC::ClientCertificateRevocationListStatusCode::Active
      else
        nil
      end
    end
  end
end
