json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :email, :info
  json.url applicant_url(applicant, format: :json)
end
