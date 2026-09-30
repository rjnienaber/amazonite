private alias AS = Amazonite::S3

module Amazonite::S3
  enum ServerSideEncryption
    Aes256
    AwsFsx
    AwsBackup
    AwsKms
    AwsKmsDsse

    def self.to_json(e : ServerSideEncryption, json : JSON::Builder) : Nil
      value = case e
              when AS::ServerSideEncryption::Aes256     then "AES256"
              when AS::ServerSideEncryption::AwsFsx     then "aws:fsx"
              when AS::ServerSideEncryption::AwsBackup  then "aws:backup"
              when AS::ServerSideEncryption::AwsKms     then "aws:kms"
              when AS::ServerSideEncryption::AwsKmsDsse then "aws:kms:dsse"
              else
                raise Exception.new("unknown enum value for 'ServerSideEncryption' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ServerSideEncryption
      value = pull.read_string
      case value
      when "AES256"       then AS::ServerSideEncryption::Aes256
      when "aws:fsx"      then AS::ServerSideEncryption::AwsFsx
      when "aws:backup"   then AS::ServerSideEncryption::AwsBackup
      when "aws:kms"      then AS::ServerSideEncryption::AwsKms
      when "aws:kms:dsse" then AS::ServerSideEncryption::AwsKmsDsse
      else
        raise Exception.new("unknown enum value for 'ServerSideEncryption' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ServerSideEncryption::Aes256     then "AES256"
      when AS::ServerSideEncryption::AwsFsx     then "aws:fsx"
      when AS::ServerSideEncryption::AwsBackup  then "aws:backup"
      when AS::ServerSideEncryption::AwsKms     then "aws:kms"
      when AS::ServerSideEncryption::AwsKmsDsse then "aws:kms:dsse"
      else
        raise Exception.new("unknown enum value for 'ServerSideEncryption' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ServerSideEncryption?
      case key
      when "AES256"       then AS::ServerSideEncryption::Aes256
      when "aws:fsx"      then AS::ServerSideEncryption::AwsFsx
      when "aws:backup"   then AS::ServerSideEncryption::AwsBackup
      when "aws:kms"      then AS::ServerSideEncryption::AwsKms
      when "aws:kms:dsse" then AS::ServerSideEncryption::AwsKmsDsse
      else
        nil
      end
    end
  end
end
