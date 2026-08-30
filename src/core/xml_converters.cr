require "base64"
require "xml"

# Scalar (de)serialization helpers for the awsQuery protocol's generated
# `to_query_params`/`from_xml` model methods - the query wire format encodes
# every scalar as plain text (form value or XML element content), so these
# just centralize the text <-> Crystal-type conversion for the handful of
# non-String primitive types (JSON has its own separate converters in
# converters.cr, since its wire representation differs, e.g. numbers/bools
# aren't quoted text there).
module Amazonite::Core::XMLValue
  def self.string(node : XML::Node?) : String?
    node.try(&.content)
  end

  def self.i32(node : XML::Node?) : Int32?
    node.try(&.content.to_i32)
  end

  def self.i64(node : XML::Node?) : Int64?
    node.try(&.content.to_i64)
  end

  def self.f32(node : XML::Node?) : Float32?
    node.try(&.content.to_f32)
  end

  def self.f64(node : XML::Node?) : Float64?
    node.try(&.content.to_f64)
  end

  def self.bool(node : XML::Node?) : Bool?
    node.try(&.content) == "true" if node
  end

  def self.bytes(node : XML::Node?) : Bytes?
    Base64.decode(node.content) if node
  end

  def self.time(node : XML::Node?) : Time?
    Time.parse_iso8601(node.content) if node
  end
end

# The Crystal-type -> query-text conversion counterpart to `XMLValue`, for
# the awsQuery protocol's generated `to_query_params` model methods.
module Amazonite::Core::QueryValue
  def self.bool(value : Bool) : String
    value ? "true" : "false"
  end

  def self.bytes(value : Bytes) : String
    Base64.strict_encode(value)
  end

  def self.time(value : Time) : String
    value.to_utc.to_rfc3339
  end
end
