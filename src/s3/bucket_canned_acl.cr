private alias AS = Amazonite::S3

module Amazonite::S3
  enum BucketCannedACL
    Private
    PublicRead
    PublicReadWrite
    AuthenticatedRead

    def self.to_json(e : BucketCannedACL, json : JSON::Builder) : Nil
      value = case e
              when AS::BucketCannedACL::Private           then "private"
              when AS::BucketCannedACL::PublicRead        then "public-read"
              when AS::BucketCannedACL::PublicReadWrite   then "public-read-write"
              when AS::BucketCannedACL::AuthenticatedRead then "authenticated-read"
              else
                raise Exception.new("unknown enum value for 'BucketCannedACL' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::BucketCannedACL
      value = pull.read_string
      case value
      when "private"            then AS::BucketCannedACL::Private
      when "public-read"        then AS::BucketCannedACL::PublicRead
      when "public-read-write"  then AS::BucketCannedACL::PublicReadWrite
      when "authenticated-read" then AS::BucketCannedACL::AuthenticatedRead
      else
        raise Exception.new("unknown enum value for 'BucketCannedACL' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::BucketCannedACL::Private           then "private"
      when AS::BucketCannedACL::PublicRead        then "public-read"
      when AS::BucketCannedACL::PublicReadWrite   then "public-read-write"
      when AS::BucketCannedACL::AuthenticatedRead then "authenticated-read"
      else
        raise Exception.new("unknown enum value for 'BucketCannedACL' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::BucketCannedACL?
      case key
      when "private"            then AS::BucketCannedACL::Private
      when "public-read"        then AS::BucketCannedACL::PublicRead
      when "public-read-write"  then AS::BucketCannedACL::PublicReadWrite
      when "authenticated-read" then AS::BucketCannedACL::AuthenticatedRead
      else
        nil
      end
    end
  end
end
