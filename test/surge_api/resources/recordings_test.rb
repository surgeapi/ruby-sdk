# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::RecordingsTest < SurgeAPI::Test::ResourceTest
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
    skip("Mock server doesn't properly handle redirects")

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
