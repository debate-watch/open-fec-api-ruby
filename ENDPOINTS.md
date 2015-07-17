## Endpoints

Endpoint | Operation | Wrapper Method
--- | --- | ---
Candidates | `GET /candidate/{candidate_id}` | `Candidate#find`
Candidates | `GET /candidate/{candidate_id}/history` | N/A
Candidates | `GET /candidate/{candidate_id}/history/{cycle}` | N/A
Candidates | `GET /candidates` | `Candidate#all`
Candidates | `GET /candidates/search` | N/A
Candidates | `GET /candidate/{candidate_id}/committees` | N/A
Candidates | `GET /candidate/{candidate_id}/committees/history` | N/A
Candidates | `GET /candidate/{candidate_id}/committees/history/{cycle}` | N/A
Committees | `GET /committee/{committee_id}/candidates` | N/A
Committees | `GET /committee/{committee_id}/candidates/history` | N/A
Committees | `GET /committee/{committee_id}/candidates/history/{cycle}` | N/A
Committees | `GET /committee/{committee_id}` | N/A
Committees | `GET /committee/{committee_id}/history` | N/A
Committees | `GET /committee/{committee_id}/history/{cycle}` | N/A
Committees | `GET /committees` | N/A
Filings | `GET /committee/{committee_id}/filings` | N/A
Filings | `GET /filings` | N/A
Financial | `GET /committee/{committee_id}/reports` | N/A
Financial | `GET /committee/{committee_id}/totals` | N/A
Financial | `GET /reports/{committee_type}` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_contributor` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_size` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_state` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_zip` | N/A
Schedules | `GET /schedules/schedule_a` | N/A
Schedules | `GET /schedules/schedule_a/by_contributor` | N/A
Schedules | `GET /schedules/schedule_a/by_size` | N/A
Schedules | `GET /schedules/schedule_a/by_state` | N/A
Schedules | `GET /schedules/schedule_a/by_zip` | N/A
Schedules | `GET /schedules/schedule_b` | N/A
Search | `GET /names/candidates` | `Candidate#where`
Search | `GET /names/committees` | N/A
