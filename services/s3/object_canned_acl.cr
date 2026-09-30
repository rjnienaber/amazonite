private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectCannedACL
    Private
    PublicRead
    PublicReadWrite
    AuthenticatedRead
    AwsExecRead
    BucketOwnerRead
    BucketOwnerFullControl

    def self.to_json(e : ObjectCannedACL, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectCannedACL::Private                then "private"
              when AS::ObjectCannedACL::PublicRead             then "public-read"
              when AS::ObjectCannedACL::PublicReadWrite        then "public-read-write"
              when AS::ObjectCannedACL::AuthenticatedRead      then "authenticated-read"
              when AS::ObjectCannedACL::AwsExecRead            then "aws-exec-read"
              when AS::ObjectCannedACL::BucketOwnerRead        then "bucket-owner-read"
              when AS::ObjectCannedACL::BucketOwnerFullControl then "bucket-owner-full-control"
              else
                raise Exception.new("unknown enum value for 'ObjectCannedACL' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectCannedACL
      value = pull.read_string
      case value
      when "private"                   then AS::ObjectCannedACL::Private
      when "public-read"               then AS::ObjectCannedACL::PublicRead
      when "public-read-write"         then AS::ObjectCannedACL::PublicReadWrite
      when "authenticated-read"        then AS::ObjectCannedACL::AuthenticatedRead
      when "aws-exec-read"             then AS::ObjectCannedACL::AwsExecRead
      when "bucket-owner-read"         then AS::ObjectCannedACL::BucketOwnerRead
      when "bucket-owner-full-control" then AS::ObjectCannedACL::BucketOwnerFullControl
      else
        raise Exception.new("unknown enum value for 'ObjectCannedACL' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectCannedACL::Private                then "private"
      when AS::ObjectCannedACL::PublicRead             then "public-read"
      when AS::ObjectCannedACL::PublicReadWrite        then "public-read-write"
      when AS::ObjectCannedACL::AuthenticatedRead      then "authenticated-read"
      when AS::ObjectCannedACL::AwsExecRead            then "aws-exec-read"
      when AS::ObjectCannedACL::BucketOwnerRead        then "bucket-owner-read"
      when AS::ObjectCannedACL::BucketOwnerFullControl then "bucket-owner-full-control"
      else
        raise Exception.new("unknown enum value for 'ObjectCannedACL' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectCannedACL?
      case key
      when "private"                   then AS::ObjectCannedACL::Private
      when "public-read"               then AS::ObjectCannedACL::PublicRead
      when "public-read-write"         then AS::ObjectCannedACL::PublicReadWrite
      when "authenticated-read"        then AS::ObjectCannedACL::AuthenticatedRead
      when "aws-exec-read"             then AS::ObjectCannedACL::AwsExecRead
      when "bucket-owner-read"         then AS::ObjectCannedACL::BucketOwnerRead
      when "bucket-owner-full-control" then AS::ObjectCannedACL::BucketOwnerFullControl
      else
        nil
      end
    end
  end
end
