json.array!(@scorecards) do |scorecard|
  json.extract! scorecard, :id, :site_id, :org_name, :data
  json.url scorecard_url(scorecard, format: :json)
end
