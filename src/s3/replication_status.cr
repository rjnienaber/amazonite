private alias AS = Amazonite::S3

module Amazonite::S3
  enum ReplicationStatus
    Complete
    Pending
    Failed
    Replica
    Completed

    def self.to_json(e : ReplicationStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ReplicationStatus::Complete  then "COMPLETE"
              when AS::ReplicationStatus::Pending   then "PENDING"
              when AS::ReplicationStatus::Failed    then "FAILED"
              when AS::ReplicationStatus::Replica   then "REPLICA"
              when AS::ReplicationStatus::Completed then "COMPLETED"
              else
                raise Exception.new("unknown enum value for 'ReplicationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ReplicationStatus
      value = pull.read_string
      case value
      when "COMPLETE"  then AS::ReplicationStatus::Complete
      when "PENDING"   then AS::ReplicationStatus::Pending
      when "FAILED"    then AS::ReplicationStatus::Failed
      when "REPLICA"   then AS::ReplicationStatus::Replica
      when "COMPLETED" then AS::ReplicationStatus::Completed
      else
        raise Exception.new("unknown enum value for 'ReplicationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ReplicationStatus::Complete  then "COMPLETE"
      when AS::ReplicationStatus::Pending   then "PENDING"
      when AS::ReplicationStatus::Failed    then "FAILED"
      when AS::ReplicationStatus::Replica   then "REPLICA"
      when AS::ReplicationStatus::Completed then "COMPLETED"
      else
        raise Exception.new("unknown enum value for 'ReplicationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ReplicationStatus?
      case key
      when "COMPLETE"  then AS::ReplicationStatus::Complete
      when "PENDING"   then AS::ReplicationStatus::Pending
      when "FAILED"    then AS::ReplicationStatus::Failed
      when "REPLICA"   then AS::ReplicationStatus::Replica
      when "COMPLETED" then AS::ReplicationStatus::Completed
      else
        nil
      end
    end
  end
end
