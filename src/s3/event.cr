private alias AS = Amazonite::S3

module Amazonite::S3
  # The bucket event for which to send notifications.
  enum Event
    S3ReducedRedundancyLostObject
    S3ObjectCreatedAll
    S3ObjectCreatedPut
    S3ObjectCreatedPost
    S3ObjectCreatedCopy
    S3ObjectCreatedCompleteMultipartUpload
    S3ObjectRemovedAll
    S3ObjectRemovedDelete
    S3ObjectRemovedDeleteMarkerCreated
    S3ObjectRestoreAll
    S3ObjectRestorePost
    S3ObjectRestoreCompleted
    S3ReplicationAll
    S3ReplicationOperationFailedReplication
    S3ReplicationOperationNotTracked
    S3ReplicationOperationMissedThreshold
    S3ReplicationOperationReplicatedAfterThreshold
    S3ObjectRestoreDelete
    S3LifecycleTransition
    S3IntelligentTiering
    S3ObjectAclPut
    S3LifecycleExpirationAll
    S3LifecycleExpirationDelete
    S3LifecycleExpirationDeleteMarkerCreated
    S3ObjectTaggingAll
    S3ObjectTaggingPut
    S3ObjectTaggingDelete
    S3ObjectAnnotationAll
    S3ObjectAnnotationPut
    S3ObjectAnnotationDelete

    def self.to_json(e : Event, json : JSON::Builder) : Nil
      value = case e
              when AS::Event::S3ReducedRedundancyLostObject                  then "s3:ReducedRedundancyLostObject"
              when AS::Event::S3ObjectCreatedAll                             then "s3:ObjectCreated:*"
              when AS::Event::S3ObjectCreatedPut                             then "s3:ObjectCreated:Put"
              when AS::Event::S3ObjectCreatedPost                            then "s3:ObjectCreated:Post"
              when AS::Event::S3ObjectCreatedCopy                            then "s3:ObjectCreated:Copy"
              when AS::Event::S3ObjectCreatedCompleteMultipartUpload         then "s3:ObjectCreated:CompleteMultipartUpload"
              when AS::Event::S3ObjectRemovedAll                             then "s3:ObjectRemoved:*"
              when AS::Event::S3ObjectRemovedDelete                          then "s3:ObjectRemoved:Delete"
              when AS::Event::S3ObjectRemovedDeleteMarkerCreated             then "s3:ObjectRemoved:DeleteMarkerCreated"
              when AS::Event::S3ObjectRestoreAll                             then "s3:ObjectRestore:*"
              when AS::Event::S3ObjectRestorePost                            then "s3:ObjectRestore:Post"
              when AS::Event::S3ObjectRestoreCompleted                       then "s3:ObjectRestore:Completed"
              when AS::Event::S3ReplicationAll                               then "s3:Replication:*"
              when AS::Event::S3ReplicationOperationFailedReplication        then "s3:Replication:OperationFailedReplication"
              when AS::Event::S3ReplicationOperationNotTracked               then "s3:Replication:OperationNotTracked"
              when AS::Event::S3ReplicationOperationMissedThreshold          then "s3:Replication:OperationMissedThreshold"
              when AS::Event::S3ReplicationOperationReplicatedAfterThreshold then "s3:Replication:OperationReplicatedAfterThreshold"
              when AS::Event::S3ObjectRestoreDelete                          then "s3:ObjectRestore:Delete"
              when AS::Event::S3LifecycleTransition                          then "s3:LifecycleTransition"
              when AS::Event::S3IntelligentTiering                           then "s3:IntelligentTiering"
              when AS::Event::S3ObjectAclPut                                 then "s3:ObjectAcl:Put"
              when AS::Event::S3LifecycleExpirationAll                       then "s3:LifecycleExpiration:*"
              when AS::Event::S3LifecycleExpirationDelete                    then "s3:LifecycleExpiration:Delete"
              when AS::Event::S3LifecycleExpirationDeleteMarkerCreated       then "s3:LifecycleExpiration:DeleteMarkerCreated"
              when AS::Event::S3ObjectTaggingAll                             then "s3:ObjectTagging:*"
              when AS::Event::S3ObjectTaggingPut                             then "s3:ObjectTagging:Put"
              when AS::Event::S3ObjectTaggingDelete                          then "s3:ObjectTagging:Delete"
              when AS::Event::S3ObjectAnnotationAll                          then "s3:ObjectAnnotation:*"
              when AS::Event::S3ObjectAnnotationPut                          then "s3:ObjectAnnotation:Put"
              when AS::Event::S3ObjectAnnotationDelete                       then "s3:ObjectAnnotation:Delete"
              else
                raise Exception.new("unknown enum value for 'Event' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Event
      value = pull.read_string
      case value
      when "s3:ReducedRedundancyLostObject"                   then AS::Event::S3ReducedRedundancyLostObject
      when "s3:ObjectCreated:*"                               then AS::Event::S3ObjectCreatedAll
      when "s3:ObjectCreated:Put"                             then AS::Event::S3ObjectCreatedPut
      when "s3:ObjectCreated:Post"                            then AS::Event::S3ObjectCreatedPost
      when "s3:ObjectCreated:Copy"                            then AS::Event::S3ObjectCreatedCopy
      when "s3:ObjectCreated:CompleteMultipartUpload"         then AS::Event::S3ObjectCreatedCompleteMultipartUpload
      when "s3:ObjectRemoved:*"                               then AS::Event::S3ObjectRemovedAll
      when "s3:ObjectRemoved:Delete"                          then AS::Event::S3ObjectRemovedDelete
      when "s3:ObjectRemoved:DeleteMarkerCreated"             then AS::Event::S3ObjectRemovedDeleteMarkerCreated
      when "s3:ObjectRestore:*"                               then AS::Event::S3ObjectRestoreAll
      when "s3:ObjectRestore:Post"                            then AS::Event::S3ObjectRestorePost
      when "s3:ObjectRestore:Completed"                       then AS::Event::S3ObjectRestoreCompleted
      when "s3:Replication:*"                                 then AS::Event::S3ReplicationAll
      when "s3:Replication:OperationFailedReplication"        then AS::Event::S3ReplicationOperationFailedReplication
      when "s3:Replication:OperationNotTracked"               then AS::Event::S3ReplicationOperationNotTracked
      when "s3:Replication:OperationMissedThreshold"          then AS::Event::S3ReplicationOperationMissedThreshold
      when "s3:Replication:OperationReplicatedAfterThreshold" then AS::Event::S3ReplicationOperationReplicatedAfterThreshold
      when "s3:ObjectRestore:Delete"                          then AS::Event::S3ObjectRestoreDelete
      when "s3:LifecycleTransition"                           then AS::Event::S3LifecycleTransition
      when "s3:IntelligentTiering"                            then AS::Event::S3IntelligentTiering
      when "s3:ObjectAcl:Put"                                 then AS::Event::S3ObjectAclPut
      when "s3:LifecycleExpiration:*"                         then AS::Event::S3LifecycleExpirationAll
      when "s3:LifecycleExpiration:Delete"                    then AS::Event::S3LifecycleExpirationDelete
      when "s3:LifecycleExpiration:DeleteMarkerCreated"       then AS::Event::S3LifecycleExpirationDeleteMarkerCreated
      when "s3:ObjectTagging:*"                               then AS::Event::S3ObjectTaggingAll
      when "s3:ObjectTagging:Put"                             then AS::Event::S3ObjectTaggingPut
      when "s3:ObjectTagging:Delete"                          then AS::Event::S3ObjectTaggingDelete
      when "s3:ObjectAnnotation:*"                            then AS::Event::S3ObjectAnnotationAll
      when "s3:ObjectAnnotation:Put"                          then AS::Event::S3ObjectAnnotationPut
      when "s3:ObjectAnnotation:Delete"                       then AS::Event::S3ObjectAnnotationDelete
      else
        raise Exception.new("unknown enum value for 'Event' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::Event::S3ReducedRedundancyLostObject                  then "s3:ReducedRedundancyLostObject"
      when AS::Event::S3ObjectCreatedAll                             then "s3:ObjectCreated:*"
      when AS::Event::S3ObjectCreatedPut                             then "s3:ObjectCreated:Put"
      when AS::Event::S3ObjectCreatedPost                            then "s3:ObjectCreated:Post"
      when AS::Event::S3ObjectCreatedCopy                            then "s3:ObjectCreated:Copy"
      when AS::Event::S3ObjectCreatedCompleteMultipartUpload         then "s3:ObjectCreated:CompleteMultipartUpload"
      when AS::Event::S3ObjectRemovedAll                             then "s3:ObjectRemoved:*"
      when AS::Event::S3ObjectRemovedDelete                          then "s3:ObjectRemoved:Delete"
      when AS::Event::S3ObjectRemovedDeleteMarkerCreated             then "s3:ObjectRemoved:DeleteMarkerCreated"
      when AS::Event::S3ObjectRestoreAll                             then "s3:ObjectRestore:*"
      when AS::Event::S3ObjectRestorePost                            then "s3:ObjectRestore:Post"
      when AS::Event::S3ObjectRestoreCompleted                       then "s3:ObjectRestore:Completed"
      when AS::Event::S3ReplicationAll                               then "s3:Replication:*"
      when AS::Event::S3ReplicationOperationFailedReplication        then "s3:Replication:OperationFailedReplication"
      when AS::Event::S3ReplicationOperationNotTracked               then "s3:Replication:OperationNotTracked"
      when AS::Event::S3ReplicationOperationMissedThreshold          then "s3:Replication:OperationMissedThreshold"
      when AS::Event::S3ReplicationOperationReplicatedAfterThreshold then "s3:Replication:OperationReplicatedAfterThreshold"
      when AS::Event::S3ObjectRestoreDelete                          then "s3:ObjectRestore:Delete"
      when AS::Event::S3LifecycleTransition                          then "s3:LifecycleTransition"
      when AS::Event::S3IntelligentTiering                           then "s3:IntelligentTiering"
      when AS::Event::S3ObjectAclPut                                 then "s3:ObjectAcl:Put"
      when AS::Event::S3LifecycleExpirationAll                       then "s3:LifecycleExpiration:*"
      when AS::Event::S3LifecycleExpirationDelete                    then "s3:LifecycleExpiration:Delete"
      when AS::Event::S3LifecycleExpirationDeleteMarkerCreated       then "s3:LifecycleExpiration:DeleteMarkerCreated"
      when AS::Event::S3ObjectTaggingAll                             then "s3:ObjectTagging:*"
      when AS::Event::S3ObjectTaggingPut                             then "s3:ObjectTagging:Put"
      when AS::Event::S3ObjectTaggingDelete                          then "s3:ObjectTagging:Delete"
      when AS::Event::S3ObjectAnnotationAll                          then "s3:ObjectAnnotation:*"
      when AS::Event::S3ObjectAnnotationPut                          then "s3:ObjectAnnotation:Put"
      when AS::Event::S3ObjectAnnotationDelete                       then "s3:ObjectAnnotation:Delete"
      else
        raise Exception.new("unknown enum value for 'Event' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::Event?
      case key
      when "s3:ReducedRedundancyLostObject"                   then AS::Event::S3ReducedRedundancyLostObject
      when "s3:ObjectCreated:*"                               then AS::Event::S3ObjectCreatedAll
      when "s3:ObjectCreated:Put"                             then AS::Event::S3ObjectCreatedPut
      when "s3:ObjectCreated:Post"                            then AS::Event::S3ObjectCreatedPost
      when "s3:ObjectCreated:Copy"                            then AS::Event::S3ObjectCreatedCopy
      when "s3:ObjectCreated:CompleteMultipartUpload"         then AS::Event::S3ObjectCreatedCompleteMultipartUpload
      when "s3:ObjectRemoved:*"                               then AS::Event::S3ObjectRemovedAll
      when "s3:ObjectRemoved:Delete"                          then AS::Event::S3ObjectRemovedDelete
      when "s3:ObjectRemoved:DeleteMarkerCreated"             then AS::Event::S3ObjectRemovedDeleteMarkerCreated
      when "s3:ObjectRestore:*"                               then AS::Event::S3ObjectRestoreAll
      when "s3:ObjectRestore:Post"                            then AS::Event::S3ObjectRestorePost
      when "s3:ObjectRestore:Completed"                       then AS::Event::S3ObjectRestoreCompleted
      when "s3:Replication:*"                                 then AS::Event::S3ReplicationAll
      when "s3:Replication:OperationFailedReplication"        then AS::Event::S3ReplicationOperationFailedReplication
      when "s3:Replication:OperationNotTracked"               then AS::Event::S3ReplicationOperationNotTracked
      when "s3:Replication:OperationMissedThreshold"          then AS::Event::S3ReplicationOperationMissedThreshold
      when "s3:Replication:OperationReplicatedAfterThreshold" then AS::Event::S3ReplicationOperationReplicatedAfterThreshold
      when "s3:ObjectRestore:Delete"                          then AS::Event::S3ObjectRestoreDelete
      when "s3:LifecycleTransition"                           then AS::Event::S3LifecycleTransition
      when "s3:IntelligentTiering"                            then AS::Event::S3IntelligentTiering
      when "s3:ObjectAcl:Put"                                 then AS::Event::S3ObjectAclPut
      when "s3:LifecycleExpiration:*"                         then AS::Event::S3LifecycleExpirationAll
      when "s3:LifecycleExpiration:Delete"                    then AS::Event::S3LifecycleExpirationDelete
      when "s3:LifecycleExpiration:DeleteMarkerCreated"       then AS::Event::S3LifecycleExpirationDeleteMarkerCreated
      when "s3:ObjectTagging:*"                               then AS::Event::S3ObjectTaggingAll
      when "s3:ObjectTagging:Put"                             then AS::Event::S3ObjectTaggingPut
      when "s3:ObjectTagging:Delete"                          then AS::Event::S3ObjectTaggingDelete
      when "s3:ObjectAnnotation:*"                            then AS::Event::S3ObjectAnnotationAll
      when "s3:ObjectAnnotation:Put"                          then AS::Event::S3ObjectAnnotationPut
      when "s3:ObjectAnnotation:Delete"                       then AS::Event::S3ObjectAnnotationDelete
      else
        nil
      end
    end
  end
end
