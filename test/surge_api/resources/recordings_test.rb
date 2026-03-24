# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::RecordingsTest < SurgeAPI::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @surge.recordings.retrieve("rec_01kfyc9dgdec1avkgs7tng8htg")

    assert_pattern do
      response => SurgeAPI::Models::RecordingRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        call: SurgeAPI::Models::RecordingRetrieveResponse::Call,
        duration: Integer
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @surge.recordings.list("acct_01j9a43avnfqzbjfch6pygv1td")

    assert_pattern do
      response => SurgeAPI::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => SurgeAPI::Models::RecordingListResponse
    end

    assert_pattern do
      row => {
        id: String,
        call: SurgeAPI::Models::RecordingListResponse::Call,
        duration: Integer
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @surge.recordings.delete("rec_01kfyc9dgdec1avkgs7tng8htg")

    assert_pattern do
      response => SurgeAPI::Models::RecordingDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        call: SurgeAPI::Models::RecordingDeleteResponse::Call,
        duration: Integer
      }
    end
  end

  def test_get_file
    skip("Mock server tests are disabled")

    response = @surge.recordings.get_file("rec_01kfyc9dgdec1avkgs7tng8htg")

    assert_pattern do
      response => SurgeAPI::Models::RecordingGetFileResponse
    end

    assert_pattern do
      response => {
        error: SurgeAPI::Error
      }
    end
  end
end
