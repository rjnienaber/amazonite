require "http/headers"

# Scalar (de)serialization helpers for the http-bound members of a rest
# protocol's request/response - a header carries plain text, so every
# non-String member type needs a text conversion, and unlike a body value
# the timestamp format depends on the binding rather than the protocol
# (Smithy defaults an httpHeader timestamp to http-date and an httpQuery or
# httpLabel one to date-time, either overridable per shape).
module Amazonite::Core::HeaderValue
  def self.http_time(value : String?) : Time?
    HTTP.parse_time(value) if value
  end

  def self.date_time(value : String?) : Time?
    Time.parse_rfc3339(value) if value
  end

  def self.format_http_time(value : Time) : String
    HTTP.format_time(value)
  end

  def self.format_date_time(value : Time) : String
    value.to_utc.to_rfc3339
  end

  def self.epoch(value : String?) : Time?
    Time.unix(value.to_i64) if value
  end

  def self.format_epoch(value : Time) : String
    value.to_unix.to_s
  end

  def self.i32(value : String?) : Int32?
    value.try(&.to_i32)
  end

  def self.i64(value : String?) : Int64?
    value.try(&.to_i64)
  end

  def self.bool(value : String?) : Bool?
    value == "true" if value
  end

  # A list-typed header is one header holding comma-separated values, not
  # one header per element, so it splits rather than being read repeatedly.
  def self.list(value : String?) : Array(String)?
    value.split(',').map(&.strip) if value
  end

  # Every header whose name starts with `prefix` (smithy.api#httpPrefixHeaders,
  # e.g. S3's "x-amz-meta-" user metadata), keyed by the remainder of the
  # name. Header names are case-insensitive on the wire, so the prefix is
  # matched that way too, and the key keeps the casing the service sent.
  def self.prefixed(headers : HTTP::Headers, prefix : String) : Hash(String, String)
    headers.each_with_object({} of String => String) do |(name, values), hash|
      next unless name.size > prefix.size && name[0, prefix.size].compare(prefix, case_insensitive: true) == 0

      hash[name[prefix.size..]] = values.join(", ")
    end
  end
end
