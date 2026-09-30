private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TieringOperationStatus
    ArchivalInProgress
    ArchivalCompleted
    ArchivalFailed
    TemporaryRestoreInProgress
    TemporaryRestoreCompleted
    TemporaryRestoreFailed
    PermanentRestoreInProgress
    PermanentRestoreCompleted
    PermanentRestoreFailed

    def self.to_json(e : TieringOperationStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::TieringOperationStatus::ArchivalInProgress         then "archival-in-progress"
              when AEC::TieringOperationStatus::ArchivalCompleted          then "archival-completed"
              when AEC::TieringOperationStatus::ArchivalFailed             then "archival-failed"
              when AEC::TieringOperationStatus::TemporaryRestoreInProgress then "temporary-restore-in-progress"
              when AEC::TieringOperationStatus::TemporaryRestoreCompleted  then "temporary-restore-completed"
              when AEC::TieringOperationStatus::TemporaryRestoreFailed     then "temporary-restore-failed"
              when AEC::TieringOperationStatus::PermanentRestoreInProgress then "permanent-restore-in-progress"
              when AEC::TieringOperationStatus::PermanentRestoreCompleted  then "permanent-restore-completed"
              when AEC::TieringOperationStatus::PermanentRestoreFailed     then "permanent-restore-failed"
              else
                raise Exception.new("unknown enum value for 'TieringOperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TieringOperationStatus
      value = pull.read_string
      case value
      when "archival-in-progress"          then AEC::TieringOperationStatus::ArchivalInProgress
      when "archival-completed"            then AEC::TieringOperationStatus::ArchivalCompleted
      when "archival-failed"               then AEC::TieringOperationStatus::ArchivalFailed
      when "temporary-restore-in-progress" then AEC::TieringOperationStatus::TemporaryRestoreInProgress
      when "temporary-restore-completed"   then AEC::TieringOperationStatus::TemporaryRestoreCompleted
      when "temporary-restore-failed"      then AEC::TieringOperationStatus::TemporaryRestoreFailed
      when "permanent-restore-in-progress" then AEC::TieringOperationStatus::PermanentRestoreInProgress
      when "permanent-restore-completed"   then AEC::TieringOperationStatus::PermanentRestoreCompleted
      when "permanent-restore-failed"      then AEC::TieringOperationStatus::PermanentRestoreFailed
      else
        raise Exception.new("unknown enum value for 'TieringOperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TieringOperationStatus::ArchivalInProgress         then "archival-in-progress"
      when AEC::TieringOperationStatus::ArchivalCompleted          then "archival-completed"
      when AEC::TieringOperationStatus::ArchivalFailed             then "archival-failed"
      when AEC::TieringOperationStatus::TemporaryRestoreInProgress then "temporary-restore-in-progress"
      when AEC::TieringOperationStatus::TemporaryRestoreCompleted  then "temporary-restore-completed"
      when AEC::TieringOperationStatus::TemporaryRestoreFailed     then "temporary-restore-failed"
      when AEC::TieringOperationStatus::PermanentRestoreInProgress then "permanent-restore-in-progress"
      when AEC::TieringOperationStatus::PermanentRestoreCompleted  then "permanent-restore-completed"
      when AEC::TieringOperationStatus::PermanentRestoreFailed     then "permanent-restore-failed"
      else
        raise Exception.new("unknown enum value for 'TieringOperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TieringOperationStatus?
      case key
      when "archival-in-progress"          then AEC::TieringOperationStatus::ArchivalInProgress
      when "archival-completed"            then AEC::TieringOperationStatus::ArchivalCompleted
      when "archival-failed"               then AEC::TieringOperationStatus::ArchivalFailed
      when "temporary-restore-in-progress" then AEC::TieringOperationStatus::TemporaryRestoreInProgress
      when "temporary-restore-completed"   then AEC::TieringOperationStatus::TemporaryRestoreCompleted
      when "temporary-restore-failed"      then AEC::TieringOperationStatus::TemporaryRestoreFailed
      when "permanent-restore-in-progress" then AEC::TieringOperationStatus::PermanentRestoreInProgress
      when "permanent-restore-completed"   then AEC::TieringOperationStatus::PermanentRestoreCompleted
      when "permanent-restore-failed"      then AEC::TieringOperationStatus::PermanentRestoreFailed
      else
        nil
      end
    end
  end
end
