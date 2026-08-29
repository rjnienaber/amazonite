private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum StandardUnit
    Seconds
    Microseconds
    Milliseconds
    Bytes
    Kilobytes
    Megabytes
    Gigabytes
    Terabytes
    Bits
    Kilobits
    Megabits
    Gigabits
    Terabits
    Percent
    Count
    BytesSecond
    KilobytesSecond
    MegabytesSecond
    GigabytesSecond
    TerabytesSecond
    BitsSecond
    KilobitsSecond
    MegabitsSecond
    GigabitsSecond
    TerabitsSecond
    CountSecond
    None

    def self.to_json(e : StandardUnit, json : JSON::Builder) : Nil
      value = case e
              when ACW::StandardUnit::Seconds         then "Seconds"
              when ACW::StandardUnit::Microseconds    then "Microseconds"
              when ACW::StandardUnit::Milliseconds    then "Milliseconds"
              when ACW::StandardUnit::Bytes           then "Bytes"
              when ACW::StandardUnit::Kilobytes       then "Kilobytes"
              when ACW::StandardUnit::Megabytes       then "Megabytes"
              when ACW::StandardUnit::Gigabytes       then "Gigabytes"
              when ACW::StandardUnit::Terabytes       then "Terabytes"
              when ACW::StandardUnit::Bits            then "Bits"
              when ACW::StandardUnit::Kilobits        then "Kilobits"
              when ACW::StandardUnit::Megabits        then "Megabits"
              when ACW::StandardUnit::Gigabits        then "Gigabits"
              when ACW::StandardUnit::Terabits        then "Terabits"
              when ACW::StandardUnit::Percent         then "Percent"
              when ACW::StandardUnit::Count           then "Count"
              when ACW::StandardUnit::BytesSecond     then "Bytes/Second"
              when ACW::StandardUnit::KilobytesSecond then "Kilobytes/Second"
              when ACW::StandardUnit::MegabytesSecond then "Megabytes/Second"
              when ACW::StandardUnit::GigabytesSecond then "Gigabytes/Second"
              when ACW::StandardUnit::TerabytesSecond then "Terabytes/Second"
              when ACW::StandardUnit::BitsSecond      then "Bits/Second"
              when ACW::StandardUnit::KilobitsSecond  then "Kilobits/Second"
              when ACW::StandardUnit::MegabitsSecond  then "Megabits/Second"
              when ACW::StandardUnit::GigabitsSecond  then "Gigabits/Second"
              when ACW::StandardUnit::TerabitsSecond  then "Terabits/Second"
              when ACW::StandardUnit::CountSecond     then "Count/Second"
              when ACW::StandardUnit::None            then "None"
              else
                raise Exception.new("unknown enum value for 'StandardUnit' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::StandardUnit
      value = pull.read_string
      case value
      when "Seconds"          then ACW::StandardUnit::Seconds
      when "Microseconds"     then ACW::StandardUnit::Microseconds
      when "Milliseconds"     then ACW::StandardUnit::Milliseconds
      when "Bytes"            then ACW::StandardUnit::Bytes
      when "Kilobytes"        then ACW::StandardUnit::Kilobytes
      when "Megabytes"        then ACW::StandardUnit::Megabytes
      when "Gigabytes"        then ACW::StandardUnit::Gigabytes
      when "Terabytes"        then ACW::StandardUnit::Terabytes
      when "Bits"             then ACW::StandardUnit::Bits
      when "Kilobits"         then ACW::StandardUnit::Kilobits
      when "Megabits"         then ACW::StandardUnit::Megabits
      when "Gigabits"         then ACW::StandardUnit::Gigabits
      when "Terabits"         then ACW::StandardUnit::Terabits
      when "Percent"          then ACW::StandardUnit::Percent
      when "Count"            then ACW::StandardUnit::Count
      when "Bytes/Second"     then ACW::StandardUnit::BytesSecond
      when "Kilobytes/Second" then ACW::StandardUnit::KilobytesSecond
      when "Megabytes/Second" then ACW::StandardUnit::MegabytesSecond
      when "Gigabytes/Second" then ACW::StandardUnit::GigabytesSecond
      when "Terabytes/Second" then ACW::StandardUnit::TerabytesSecond
      when "Bits/Second"      then ACW::StandardUnit::BitsSecond
      when "Kilobits/Second"  then ACW::StandardUnit::KilobitsSecond
      when "Megabits/Second"  then ACW::StandardUnit::MegabitsSecond
      when "Gigabits/Second"  then ACW::StandardUnit::GigabitsSecond
      when "Terabits/Second"  then ACW::StandardUnit::TerabitsSecond
      when "Count/Second"     then ACW::StandardUnit::CountSecond
      when "None"             then ACW::StandardUnit::None
      else
        raise Exception.new("unknown enum value for 'StandardUnit' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::StandardUnit::Seconds         then "Seconds"
      when ACW::StandardUnit::Microseconds    then "Microseconds"
      when ACW::StandardUnit::Milliseconds    then "Milliseconds"
      when ACW::StandardUnit::Bytes           then "Bytes"
      when ACW::StandardUnit::Kilobytes       then "Kilobytes"
      when ACW::StandardUnit::Megabytes       then "Megabytes"
      when ACW::StandardUnit::Gigabytes       then "Gigabytes"
      when ACW::StandardUnit::Terabytes       then "Terabytes"
      when ACW::StandardUnit::Bits            then "Bits"
      when ACW::StandardUnit::Kilobits        then "Kilobits"
      when ACW::StandardUnit::Megabits        then "Megabits"
      when ACW::StandardUnit::Gigabits        then "Gigabits"
      when ACW::StandardUnit::Terabits        then "Terabits"
      when ACW::StandardUnit::Percent         then "Percent"
      when ACW::StandardUnit::Count           then "Count"
      when ACW::StandardUnit::BytesSecond     then "Bytes/Second"
      when ACW::StandardUnit::KilobytesSecond then "Kilobytes/Second"
      when ACW::StandardUnit::MegabytesSecond then "Megabytes/Second"
      when ACW::StandardUnit::GigabytesSecond then "Gigabytes/Second"
      when ACW::StandardUnit::TerabytesSecond then "Terabytes/Second"
      when ACW::StandardUnit::BitsSecond      then "Bits/Second"
      when ACW::StandardUnit::KilobitsSecond  then "Kilobits/Second"
      when ACW::StandardUnit::MegabitsSecond  then "Megabits/Second"
      when ACW::StandardUnit::GigabitsSecond  then "Gigabits/Second"
      when ACW::StandardUnit::TerabitsSecond  then "Terabits/Second"
      when ACW::StandardUnit::CountSecond     then "Count/Second"
      when ACW::StandardUnit::None            then "None"
      else
        raise Exception.new("unknown enum value for 'StandardUnit' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::StandardUnit?
      case key
      when "Seconds"          then ACW::StandardUnit::Seconds
      when "Microseconds"     then ACW::StandardUnit::Microseconds
      when "Milliseconds"     then ACW::StandardUnit::Milliseconds
      when "Bytes"            then ACW::StandardUnit::Bytes
      when "Kilobytes"        then ACW::StandardUnit::Kilobytes
      when "Megabytes"        then ACW::StandardUnit::Megabytes
      when "Gigabytes"        then ACW::StandardUnit::Gigabytes
      when "Terabytes"        then ACW::StandardUnit::Terabytes
      when "Bits"             then ACW::StandardUnit::Bits
      when "Kilobits"         then ACW::StandardUnit::Kilobits
      when "Megabits"         then ACW::StandardUnit::Megabits
      when "Gigabits"         then ACW::StandardUnit::Gigabits
      when "Terabits"         then ACW::StandardUnit::Terabits
      when "Percent"          then ACW::StandardUnit::Percent
      when "Count"            then ACW::StandardUnit::Count
      when "Bytes/Second"     then ACW::StandardUnit::BytesSecond
      when "Kilobytes/Second" then ACW::StandardUnit::KilobytesSecond
      when "Megabytes/Second" then ACW::StandardUnit::MegabytesSecond
      when "Gigabytes/Second" then ACW::StandardUnit::GigabytesSecond
      when "Terabytes/Second" then ACW::StandardUnit::TerabytesSecond
      when "Bits/Second"      then ACW::StandardUnit::BitsSecond
      when "Kilobits/Second"  then ACW::StandardUnit::KilobitsSecond
      when "Megabits/Second"  then ACW::StandardUnit::MegabitsSecond
      when "Gigabits/Second"  then ACW::StandardUnit::GigabitsSecond
      when "Terabits/Second"  then ACW::StandardUnit::TerabitsSecond
      when "Count/Second"     then ACW::StandardUnit::CountSecond
      when "None"             then ACW::StandardUnit::None
      else
        nil
      end
    end
  end
end
