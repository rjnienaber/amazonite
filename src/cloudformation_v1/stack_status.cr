private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackStatus
    CreateInProgress
    CreateFailed
    CreateComplete
    RollbackInProgress
    RollbackFailed
    RollbackComplete
    DeleteInProgress
    DeleteFailed
    DeleteComplete
    UpdateInProgress
    UpdateCompleteCleanupInProgress
    UpdateComplete
    UpdateFailed
    UpdateRollbackInProgress
    UpdateRollbackFailed
    UpdateRollbackCompleteCleanupInProgress
    UpdateRollbackComplete
    ReviewInProgress
    ImportInProgress
    ImportComplete
    ImportRollbackInProgress
    ImportRollbackFailed
    ImportRollbackComplete

    def self.to_json(e : StackStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackStatus::CreateInProgress                        then "CREATE_IN_PROGRESS"
              when ACF::StackStatus::CreateFailed                            then "CREATE_FAILED"
              when ACF::StackStatus::CreateComplete                          then "CREATE_COMPLETE"
              when ACF::StackStatus::RollbackInProgress                      then "ROLLBACK_IN_PROGRESS"
              when ACF::StackStatus::RollbackFailed                          then "ROLLBACK_FAILED"
              when ACF::StackStatus::RollbackComplete                        then "ROLLBACK_COMPLETE"
              when ACF::StackStatus::DeleteInProgress                        then "DELETE_IN_PROGRESS"
              when ACF::StackStatus::DeleteFailed                            then "DELETE_FAILED"
              when ACF::StackStatus::DeleteComplete                          then "DELETE_COMPLETE"
              when ACF::StackStatus::UpdateInProgress                        then "UPDATE_IN_PROGRESS"
              when ACF::StackStatus::UpdateCompleteCleanupInProgress         then "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"
              when ACF::StackStatus::UpdateComplete                          then "UPDATE_COMPLETE"
              when ACF::StackStatus::UpdateFailed                            then "UPDATE_FAILED"
              when ACF::StackStatus::UpdateRollbackInProgress                then "UPDATE_ROLLBACK_IN_PROGRESS"
              when ACF::StackStatus::UpdateRollbackFailed                    then "UPDATE_ROLLBACK_FAILED"
              when ACF::StackStatus::UpdateRollbackCompleteCleanupInProgress then "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"
              when ACF::StackStatus::UpdateRollbackComplete                  then "UPDATE_ROLLBACK_COMPLETE"
              when ACF::StackStatus::ReviewInProgress                        then "REVIEW_IN_PROGRESS"
              when ACF::StackStatus::ImportInProgress                        then "IMPORT_IN_PROGRESS"
              when ACF::StackStatus::ImportComplete                          then "IMPORT_COMPLETE"
              when ACF::StackStatus::ImportRollbackInProgress                then "IMPORT_ROLLBACK_IN_PROGRESS"
              when ACF::StackStatus::ImportRollbackFailed                    then "IMPORT_ROLLBACK_FAILED"
              when ACF::StackStatus::ImportRollbackComplete                  then "IMPORT_ROLLBACK_COMPLETE"
              else
                raise Exception.new("unknown enum value for 'StackStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackStatus
      value = pull.read_string
      case value
      when "CREATE_IN_PROGRESS"                           then ACF::StackStatus::CreateInProgress
      when "CREATE_FAILED"                                then ACF::StackStatus::CreateFailed
      when "CREATE_COMPLETE"                              then ACF::StackStatus::CreateComplete
      when "ROLLBACK_IN_PROGRESS"                         then ACF::StackStatus::RollbackInProgress
      when "ROLLBACK_FAILED"                              then ACF::StackStatus::RollbackFailed
      when "ROLLBACK_COMPLETE"                            then ACF::StackStatus::RollbackComplete
      when "DELETE_IN_PROGRESS"                           then ACF::StackStatus::DeleteInProgress
      when "DELETE_FAILED"                                then ACF::StackStatus::DeleteFailed
      when "DELETE_COMPLETE"                              then ACF::StackStatus::DeleteComplete
      when "UPDATE_IN_PROGRESS"                           then ACF::StackStatus::UpdateInProgress
      when "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"          then ACF::StackStatus::UpdateCompleteCleanupInProgress
      when "UPDATE_COMPLETE"                              then ACF::StackStatus::UpdateComplete
      when "UPDATE_FAILED"                                then ACF::StackStatus::UpdateFailed
      when "UPDATE_ROLLBACK_IN_PROGRESS"                  then ACF::StackStatus::UpdateRollbackInProgress
      when "UPDATE_ROLLBACK_FAILED"                       then ACF::StackStatus::UpdateRollbackFailed
      when "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS" then ACF::StackStatus::UpdateRollbackCompleteCleanupInProgress
      when "UPDATE_ROLLBACK_COMPLETE"                     then ACF::StackStatus::UpdateRollbackComplete
      when "REVIEW_IN_PROGRESS"                           then ACF::StackStatus::ReviewInProgress
      when "IMPORT_IN_PROGRESS"                           then ACF::StackStatus::ImportInProgress
      when "IMPORT_COMPLETE"                              then ACF::StackStatus::ImportComplete
      when "IMPORT_ROLLBACK_IN_PROGRESS"                  then ACF::StackStatus::ImportRollbackInProgress
      when "IMPORT_ROLLBACK_FAILED"                       then ACF::StackStatus::ImportRollbackFailed
      when "IMPORT_ROLLBACK_COMPLETE"                     then ACF::StackStatus::ImportRollbackComplete
      else
        raise Exception.new("unknown enum value for 'StackStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackStatus::CreateInProgress                        then "CREATE_IN_PROGRESS"
      when ACF::StackStatus::CreateFailed                            then "CREATE_FAILED"
      when ACF::StackStatus::CreateComplete                          then "CREATE_COMPLETE"
      when ACF::StackStatus::RollbackInProgress                      then "ROLLBACK_IN_PROGRESS"
      when ACF::StackStatus::RollbackFailed                          then "ROLLBACK_FAILED"
      when ACF::StackStatus::RollbackComplete                        then "ROLLBACK_COMPLETE"
      when ACF::StackStatus::DeleteInProgress                        then "DELETE_IN_PROGRESS"
      when ACF::StackStatus::DeleteFailed                            then "DELETE_FAILED"
      when ACF::StackStatus::DeleteComplete                          then "DELETE_COMPLETE"
      when ACF::StackStatus::UpdateInProgress                        then "UPDATE_IN_PROGRESS"
      when ACF::StackStatus::UpdateCompleteCleanupInProgress         then "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"
      when ACF::StackStatus::UpdateComplete                          then "UPDATE_COMPLETE"
      when ACF::StackStatus::UpdateFailed                            then "UPDATE_FAILED"
      when ACF::StackStatus::UpdateRollbackInProgress                then "UPDATE_ROLLBACK_IN_PROGRESS"
      when ACF::StackStatus::UpdateRollbackFailed                    then "UPDATE_ROLLBACK_FAILED"
      when ACF::StackStatus::UpdateRollbackCompleteCleanupInProgress then "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"
      when ACF::StackStatus::UpdateRollbackComplete                  then "UPDATE_ROLLBACK_COMPLETE"
      when ACF::StackStatus::ReviewInProgress                        then "REVIEW_IN_PROGRESS"
      when ACF::StackStatus::ImportInProgress                        then "IMPORT_IN_PROGRESS"
      when ACF::StackStatus::ImportComplete                          then "IMPORT_COMPLETE"
      when ACF::StackStatus::ImportRollbackInProgress                then "IMPORT_ROLLBACK_IN_PROGRESS"
      when ACF::StackStatus::ImportRollbackFailed                    then "IMPORT_ROLLBACK_FAILED"
      when ACF::StackStatus::ImportRollbackComplete                  then "IMPORT_ROLLBACK_COMPLETE"
      else
        raise Exception.new("unknown enum value for 'StackStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackStatus?
      case key
      when "CREATE_IN_PROGRESS"                           then ACF::StackStatus::CreateInProgress
      when "CREATE_FAILED"                                then ACF::StackStatus::CreateFailed
      when "CREATE_COMPLETE"                              then ACF::StackStatus::CreateComplete
      when "ROLLBACK_IN_PROGRESS"                         then ACF::StackStatus::RollbackInProgress
      when "ROLLBACK_FAILED"                              then ACF::StackStatus::RollbackFailed
      when "ROLLBACK_COMPLETE"                            then ACF::StackStatus::RollbackComplete
      when "DELETE_IN_PROGRESS"                           then ACF::StackStatus::DeleteInProgress
      when "DELETE_FAILED"                                then ACF::StackStatus::DeleteFailed
      when "DELETE_COMPLETE"                              then ACF::StackStatus::DeleteComplete
      when "UPDATE_IN_PROGRESS"                           then ACF::StackStatus::UpdateInProgress
      when "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"          then ACF::StackStatus::UpdateCompleteCleanupInProgress
      when "UPDATE_COMPLETE"                              then ACF::StackStatus::UpdateComplete
      when "UPDATE_FAILED"                                then ACF::StackStatus::UpdateFailed
      when "UPDATE_ROLLBACK_IN_PROGRESS"                  then ACF::StackStatus::UpdateRollbackInProgress
      when "UPDATE_ROLLBACK_FAILED"                       then ACF::StackStatus::UpdateRollbackFailed
      when "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS" then ACF::StackStatus::UpdateRollbackCompleteCleanupInProgress
      when "UPDATE_ROLLBACK_COMPLETE"                     then ACF::StackStatus::UpdateRollbackComplete
      when "REVIEW_IN_PROGRESS"                           then ACF::StackStatus::ReviewInProgress
      when "IMPORT_IN_PROGRESS"                           then ACF::StackStatus::ImportInProgress
      when "IMPORT_COMPLETE"                              then ACF::StackStatus::ImportComplete
      when "IMPORT_ROLLBACK_IN_PROGRESS"                  then ACF::StackStatus::ImportRollbackInProgress
      when "IMPORT_ROLLBACK_FAILED"                       then ACF::StackStatus::ImportRollbackFailed
      when "IMPORT_ROLLBACK_COMPLETE"                     then ACF::StackStatus::ImportRollbackComplete
      else
        nil
      end
    end
  end
end
