private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ComparisonOperator
    Eq
    Ne
    In
    Le
    Lt
    Ge
    Gt
    Between
    NotNull
    Null
    Contains
    NotContains
    BeginsWith

    def self.to_json(e : ComparisonOperator, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ComparisonOperator::Eq          then "EQ"
              when ADDB::ComparisonOperator::Ne          then "NE"
              when ADDB::ComparisonOperator::In          then "IN"
              when ADDB::ComparisonOperator::Le          then "LE"
              when ADDB::ComparisonOperator::Lt          then "LT"
              when ADDB::ComparisonOperator::Ge          then "GE"
              when ADDB::ComparisonOperator::Gt          then "GT"
              when ADDB::ComparisonOperator::Between     then "BETWEEN"
              when ADDB::ComparisonOperator::NotNull     then "NOT_NULL"
              when ADDB::ComparisonOperator::Null        then "NULL"
              when ADDB::ComparisonOperator::Contains    then "CONTAINS"
              when ADDB::ComparisonOperator::NotContains then "NOT_CONTAINS"
              when ADDB::ComparisonOperator::BeginsWith  then "BEGINS_WITH"
              else
                raise Exception.new("unknown enum value for 'ComparisonOperator' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ComparisonOperator
      value = pull.read_string
      case value
      when "EQ"           then ADDB::ComparisonOperator::Eq
      when "NE"           then ADDB::ComparisonOperator::Ne
      when "IN"           then ADDB::ComparisonOperator::In
      when "LE"           then ADDB::ComparisonOperator::Le
      when "LT"           then ADDB::ComparisonOperator::Lt
      when "GE"           then ADDB::ComparisonOperator::Ge
      when "GT"           then ADDB::ComparisonOperator::Gt
      when "BETWEEN"      then ADDB::ComparisonOperator::Between
      when "NOT_NULL"     then ADDB::ComparisonOperator::NotNull
      when "NULL"         then ADDB::ComparisonOperator::Null
      when "CONTAINS"     then ADDB::ComparisonOperator::Contains
      when "NOT_CONTAINS" then ADDB::ComparisonOperator::NotContains
      when "BEGINS_WITH"  then ADDB::ComparisonOperator::BeginsWith
      else
        raise Exception.new("unknown enum value for 'ComparisonOperator' when deserializing from json: '#{value}'")
      end
    end
  end
end