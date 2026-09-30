private alias AS = Amazonite::S3

module Amazonite::S3
  enum ChecksumAlgorithm
    Crc32
    Crc32c
    Sha1
    Sha256
    Crc64nvme
    Sha512
    Md5
    Xxhash64
    Xxhash3
    Xxhash128

    def self.to_json(e : ChecksumAlgorithm, json : JSON::Builder) : Nil
      value = case e
              when AS::ChecksumAlgorithm::Crc32     then "CRC32"
              when AS::ChecksumAlgorithm::Crc32c    then "CRC32C"
              when AS::ChecksumAlgorithm::Sha1      then "SHA1"
              when AS::ChecksumAlgorithm::Sha256    then "SHA256"
              when AS::ChecksumAlgorithm::Crc64nvme then "CRC64NVME"
              when AS::ChecksumAlgorithm::Sha512    then "SHA512"
              when AS::ChecksumAlgorithm::Md5       then "MD5"
              when AS::ChecksumAlgorithm::Xxhash64  then "XXHASH64"
              when AS::ChecksumAlgorithm::Xxhash3   then "XXHASH3"
              when AS::ChecksumAlgorithm::Xxhash128 then "XXHASH128"
              else
                raise Exception.new("unknown enum value for 'ChecksumAlgorithm' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ChecksumAlgorithm
      value = pull.read_string
      case value
      when "CRC32"     then AS::ChecksumAlgorithm::Crc32
      when "CRC32C"    then AS::ChecksumAlgorithm::Crc32c
      when "SHA1"      then AS::ChecksumAlgorithm::Sha1
      when "SHA256"    then AS::ChecksumAlgorithm::Sha256
      when "CRC64NVME" then AS::ChecksumAlgorithm::Crc64nvme
      when "SHA512"    then AS::ChecksumAlgorithm::Sha512
      when "MD5"       then AS::ChecksumAlgorithm::Md5
      when "XXHASH64"  then AS::ChecksumAlgorithm::Xxhash64
      when "XXHASH3"   then AS::ChecksumAlgorithm::Xxhash3
      when "XXHASH128" then AS::ChecksumAlgorithm::Xxhash128
      else
        raise Exception.new("unknown enum value for 'ChecksumAlgorithm' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ChecksumAlgorithm::Crc32     then "CRC32"
      when AS::ChecksumAlgorithm::Crc32c    then "CRC32C"
      when AS::ChecksumAlgorithm::Sha1      then "SHA1"
      when AS::ChecksumAlgorithm::Sha256    then "SHA256"
      when AS::ChecksumAlgorithm::Crc64nvme then "CRC64NVME"
      when AS::ChecksumAlgorithm::Sha512    then "SHA512"
      when AS::ChecksumAlgorithm::Md5       then "MD5"
      when AS::ChecksumAlgorithm::Xxhash64  then "XXHASH64"
      when AS::ChecksumAlgorithm::Xxhash3   then "XXHASH3"
      when AS::ChecksumAlgorithm::Xxhash128 then "XXHASH128"
      else
        raise Exception.new("unknown enum value for 'ChecksumAlgorithm' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ChecksumAlgorithm?
      case key
      when "CRC32"     then AS::ChecksumAlgorithm::Crc32
      when "CRC32C"    then AS::ChecksumAlgorithm::Crc32c
      when "SHA1"      then AS::ChecksumAlgorithm::Sha1
      when "SHA256"    then AS::ChecksumAlgorithm::Sha256
      when "CRC64NVME" then AS::ChecksumAlgorithm::Crc64nvme
      when "SHA512"    then AS::ChecksumAlgorithm::Sha512
      when "MD5"       then AS::ChecksumAlgorithm::Md5
      when "XXHASH64"  then AS::ChecksumAlgorithm::Xxhash64
      when "XXHASH3"   then AS::ChecksumAlgorithm::Xxhash3
      when "XXHASH128" then AS::ChecksumAlgorithm::Xxhash128
      else
        nil
      end
    end
  end
end
