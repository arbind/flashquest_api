json.meta do
  json.action_time @action_time
end

json.data JSON.parse(yield)