Feature: MADE tests

Since the tests are so long and many scenarios don't conflict, some have been combined.

- [√] User has a court date scheduled (Expected: Should get a court date printed on the Answer.)
- [√] User does not have a court date scheduled (Expected: Court date should be printed as "TBD" on the Answer.)
- [√] User court date has already passed. (Expected: Should get an exit warning screen. You can stop after the warning screen is reached.)
- [√] User has a federal mortgage and a 14 day notice to quit. (Expected: Defense on for CARES act should appear on the Answer. It should say that the wrong NTQ type was used.)
- [√] User does not have a federal mortgage. Has filed the CDC declaration. (Expected: Should get a defense related to CDC declaration printed on the Answer.)
- [√] User has not filed the CDC declaration. (Expected: No CDC defense should appear on the Answer.)
- [√] User has a "fault" case (something other than non-payment of rent) (Expected: No bugs along the way)
- [√] User has a public housing voucher. (Expected: No bugs along the way)
- [√] User has a delay in receiving RAFT rental assistance which caused to fall behind in rent. (Expected: Causes 2 paragraphs to appear in the answer: RAFT defense should appear on the answer. Relief requested should include a delay in the case until RAFT is completed.)

Scenario: User's court date has passed
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  And I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "late" choice of var "case.status" to "true"
  And I tap to continue
  Then the question id should be "not right interview"

Scenario: User has a federal mortgage and a 14 day notice to quit
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  When I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "summons" choice of var "case.status" to "true"
  When I tap to continue
  Then the question id should be "address"
  When I set the address of the var "tenant" to "112 Southampton St., Unit 1, Boston, MA 02118"
  When I set the "True" choice of var "facts.tenant_address_is_eviction_address" to "true"
  And I tap to continue
  Then the question id should be "your name"
  When I set the name of the variable "tenant" to "Uli Ula Ulther III"
  And I tap to continue
  Then the question id should be "additional tenants"
  When I set the var "additional_tenants.there_are_any" to "False"
  Then the question id should be "how named on summons"
  When I set the "False" choice of var "tenant.name_different_on_summons" to "true"
  #When I t#ap the var "tenant.name_different_on_summons" with the value "False"
  When I tap to continue
  Then the question id should be "reminders"
  When I set the var "remind_user" to "true"
  #When I t#ap the checkbox var "remind_user"
  When I set the var "survey_user" to "true"
  #And I t#ap the checkbox var "survey_user"
  When I set the var "edit_contact_info" to "true"
  #And I t#ap the checkbox var "edit_contact_info"
  When I tap to continue
  Then the question id should be "landlords name"
  When I set the var "landlord.name.text" to "Len Lessor"
  When I tap to continue
  Then the question id should be "landlord information"
  When I tap to continue
  Then the question id should be "landlords attorney"
  When I tap to continue
  Then the question id should be "court information"
  When I tap to continue
  Then the question id should be "court date"
  When I set the "True" choice of var "case.covid_hearing_date_assigned" to "true"
  #When I t#ap the var "case.covid_hearing_date_assigned" with the value "True"
  And I set the var "case.covid_first_event" to "01/01/2025"
  When I tap to continue
  Then the question id should be "eviction reason"
  When I set the "nonpayment" choice of var "eviction_all_reasons" to "true"
  #When I t#ap the checkbox var "eviction_all_reasons" with the value "nonpayment"
  When I tap to continue
  Then the question id should be "defense overview"
  When I tap to continue
  Then the question id should be "covid-19"
  When I set the var "covid_cares_has_federal_mortgage" to "true"
  #When I t#ap the var "covid_cares_has_federal_mortgage"
  When I set the "False" choice of var "covid_cdc_moratorium" to "true"
  #When I t#ap the var "covid_cdc_moratorium" with the value "False"
  And I tap to continue
  Then the question id should be "tenant facts"
  When I tap to continue
  Then the question id should be "rental agreement"
  When I set the var "facts.tenant_movein" to "01/01/2019"
  And I set the var "facts.tenant_rent_share" to "1"
  And I set the var "facts.tenant_rent_frequency" to "month"
  And I set the var "tenancy_type" to "lease"
  And I tap to continue
  And I wait 2 seconds
  Then the question id should be "notice to quit facts"
  When I set the var "notice_type" to "fourteen_day"
  When I set the "True" choice of var "ntq_includes_tenant_name" to "true"
  #And I t#ap the var "ntq_includes_tenant_name" with the value "True"
  When I set the "True" choice of var "ntq_includes_all_tenants" to "true"
  #And I t#ap the var "ntq_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "ntq_includes_correct_address" to "true"
  #And I t#ap the var "ntq_includes_correct_address" with the value "True"
  And I tap to continue
  Then the question id should be "nonpayment defenses"
  When I set the "True" choice of var "behind_in_rent" to "true"
  #When I t#ap the var "behind_in_rent" with the value "True"
  And I tap to continue
  Then the question id should be "tenancy facts"
  When I tap to continue
  Then the question id should be "lease type"
  When I set the var "lease_type" to "fixed_term"
  When I set the var "lease_end_date" to "01/01/2026"
  And I tap to continue
  Then the question id should be "notice timing"
  When I set the var "date_received_ntq" to "01/01/2020"
  And I set the var "date_received_summons" to "02/01/2020"
  And I tap to continue
  Then the question id should be "summons facts"
  When I set the "True" choice of var "ntq_matches_summons" to "true"
  #When I t#ap the var "ntq_matches_summons" with the value "True"
  When I set the "True" choice of var "summons_includes_all_tenants" to "true"
  #And I t#ap the var "summons_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "summons_includes_correct_address" to "true"
  #And I t#ap the var "summons_includes_correct_address" with the value "True"
  When I tap to continue
  Then the question id should be "nonpayment cure"
  When I tap to continue
  Then the question id should be "waiver"
  When I tap to continue
  Then the question id should be "have a defense"
  When I tap to continue
  Then the question id should be "bad conditions"
  # The below doesn't really need "None", but it's probably a bit confusing otherwise
  When I set the var "bad_conditions.conditions" to "true"
  #When I t#ap the var "bad_conditions.conditions"
  And I tap to continue
  Then the question id should be "retaliation splash"
  When I set the var "retaliation.is_retaliated" to "False"
  Then the question id should be "discrimination splash"
  When I set the var "tenant.is_discriminated" to "False"
  Then the question id should be "consumer protection"
  When I tap to continue
  Then the question id should be "jury trial"
  When I set the var "claim_jurytrial" to "False"
  Then the question id should be "time to move"
  When I set the var "needs_time_because" to "Busy"
  And I tap to continue
  Then the question id should be "almost done"
  When I tap to continue
  Then the question id should be "discovery"
  When I set the var "tenant_review_discovery" to "False"
  Then the question id should be "signature"
  When I set the var "signature_choice" to "this device"
  And I sign
  And I tap to continue
  Then the question id should be "method of service"
  When I set the var "method_of_service" to "emailed"
  And I set the var "service_date" to "01/01/2024"
  And I tap to continue
  Then the question id should be "intake opener"
  #When I set the var "ask_intake_questions" to "skip"
  #Then the question id should be "download screen"
  #Then I download "Eviction_Forms.zip"

Scenario: User has NO federal mortgage, but HAS filed the CDC declaration
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  When I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "summons" choice of var "case.status" to "true"
  When I tap to continue
  Then the question id should be "address"
  When I set the address of the var "tenant" to "112 Southampton St., Unit 1, Boston, MA 02118"
  When I set the "True" choice of var "facts.tenant_address_is_eviction_address" to "true"
  And I tap to continue
  Then the question id should be "your name"
  When I set the name of the variable "tenant" to "Uli Ula Ulther III"
  And I tap to continue
  Then the question id should be "additional tenants"
  When I set the var "additional_tenants.there_are_any" to "False"
  Then the question id should be "how named on summons"
  When I set the "False" choice of var "tenant.name_different_on_summons" to "true"
  #When I t#ap the var "tenant.name_different_on_summons" with the value "False"
  When I tap to continue
  Then the question id should be "reminders"
  When I set the var "remind_user" to "true"
  #When I t#ap the checkbox var "remind_user"
  When I set the var "survey_user" to "true"
  #And I t#ap the checkbox var "survey_user"
  When I set the var "edit_contact_info" to "true"
  #And I t#ap the checkbox var "edit_contact_info"
  When I tap to continue
  Then the question id should be "landlords name"
  When I set the var "landlord.name.text" to "Len Lessor"
  When I tap to continue
  Then the question id should be "landlord information"
  When I tap to continue
  Then the question id should be "landlords attorney"
  When I tap to continue
  Then the question id should be "court information"
  When I tap to continue
  Then the question id should be "court date"
  When I set the "True" choice of var "case.covid_hearing_date_assigned" to "true"
  #When I t#ap the var "case.covid_hearing_date_assigned" with the value "True"
  And I set the var "case.covid_first_event" to "01/01/2025"
  When I tap to continue
  Then the question id should be "eviction reason"
  When I set the "nonpayment" choice of var "eviction_all_reasons" to "true"
  #When I t#ap the checkbox var "eviction_all_reasons" with the value "nonpayment"
  When I tap to continue
  Then the question id should be "defense overview"
  When I tap to continue
  Then the question id should be "covid-19"
  When I set the "True" choice of var "covid_cdc_moratorium" to "true"
  #When I t#ap the var "covid_cdc_moratorium" with the value "True"
  And I tap to continue
  Then the question id should be "tenant facts"
  When I tap to continue
  Then the question id should be "rental agreement"
  When I set the var "facts.tenant_movein" to "01/01/2019"
  And I set the var "facts.tenant_rent_share" to "1"
  And I set the var "facts.tenant_rent_frequency" to "month"
  And I set the var "tenancy_type" to "lease"
  And I tap to continue
  And I wait 2 seconds
  Then the question id should be "notice to quit facts"
  When I set the var "notice_type" to "fourteen_day"
  When I set the "True" choice of var "ntq_includes_tenant_name" to "true"
  #And I t#ap the var "ntq_includes_tenant_name" with the value "True"
  When I set the "True" choice of var "ntq_includes_all_tenants" to "true"
  #And I t#ap the var "ntq_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "ntq_includes_correct_address" to "true"
  #And I t#ap the var "ntq_includes_correct_address" with the value "True"
  And I tap to continue
  Then the question id should be "nonpayment defenses"
  When I set the "True" choice of var "behind_in_rent" to "true"
  #When I t#ap the var "behind_in_rent" with the value "True"
  And I tap to continue
  Then the question id should be "tenancy facts"
  When I tap to continue
  Then the question id should be "lease type"
  When I set the var "lease_type" to "fixed_term"
  When I set the var "lease_end_date" to "01/01/2026"
  And I tap to continue
  Then the question id should be "notice timing"
  When I set the var "date_received_ntq" to "01/01/2020"
  And I set the var "date_received_summons" to "02/01/2020"
  And I tap to continue
  Then the question id should be "summons facts"
  When I set the "True" choice of var "ntq_matches_summons" to "true"
  #When I t#ap the var "ntq_matches_summons" with the value "True"
  When I set the "True" choice of var "summons_includes_all_tenants" to "true"
  #And I t#ap the var "summons_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "summons_includes_correct_address" to "true"
  #And I t#ap the var "summons_includes_correct_address" with the value "True"
  When I tap to continue
  Then the question id should be "nonpayment cure"
  When I tap to continue
  Then the question id should be "waiver"
  When I tap to continue
  Then the question id should be "have a defense"
  When I tap to continue
  Then the question id should be "bad conditions"
  # The below doesn't really need "None", but it's probably a bit confusing otherwise
  When I set the var "bad_conditions.conditions" to "true"
  #When I t#ap the var "bad_conditions.conditions"
  And I tap to continue
  Then the question id should be "retaliation splash"
  When I set the var "retaliation.is_retaliated" to "False"
  Then the question id should be "discrimination splash"
  When I set the var "tenant.is_discriminated" to "False"
  Then the question id should be "consumer protection"
  When I tap to continue
  Then the question id should be "jury trial"
  When I set the var "claim_jurytrial" to "False"
  Then the question id should be "time to move"
  When I set the var "needs_time_because" to "Busy"
  And I tap to continue
  Then the question id should be "almost done"
  When I tap to continue
  Then the question id should be "discovery"
  When I set the var "tenant_review_discovery" to "False"
  Then the question id should be "signature"
  When I set the var "signature_choice" to "this device"
  And I sign
  And I tap to continue
  Then the question id should be "method of service"
  When I set the var "method_of_service" to "emailed"
  And I set the var "service_date" to "01/01/2024"
  And I tap to continue
  Then the question id should be "intake opener"
  #When I set the var "ask_intake_questions" to "skip"
  #Then the question id should be "download screen"
  #Then I download "Eviction_Forms.zip"

Scenario: User has a "fault" case with NO court date and NO CDC declaration
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  When I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "summons" choice of var "case.status" to "true"
  When I tap to continue
  Then the question id should be "address"
  When I set the address of the var "tenant" to "112 Southampton St., Unit 1, Boston, MA 02118"
  When I set the "True" choice of var "facts.tenant_address_is_eviction_address" to "true"
  When I tap to continue
  Then the question id should be "your name"
  When I set the name of the variable "tenant" to "Uli Ula Ulther III"
  When I tap to continue
  Then the question id should be "additional tenants"
  When I set the var "additional_tenants.there_are_any" to "False"
  Then the question id should be "how named on summons"
  When I set the "False" choice of var "tenant.name_different_on_summons" to "true"
  #When I t#ap the var "tenant.name_different_on_summons" with the value "False"
  When I tap to continue
  Then the question id should be "reminders"
  When I set the var "remind_user" to "true"
  #When I t#ap the checkbox var "remind_user"
  When I set the var "survey_user" to "true"
  #And I t#ap the checkbox var "survey_user"
  When I set the var "edit_contact_info" to "true"
  #And I t#ap the checkbox var "edit_contact_info"
  When I tap to continue
  Then the question id should be "landlords name"
  When I set the var "landlord.name.text" to "Len Lessor"
  When I tap to continue
  Then the question id should be "landlord information"
  When I tap to continue
  Then the question id should be "landlords attorney"
  When I tap to continue
  Then the question id should be "court information"
  When I tap to continue
  Then the question id should be "court date"
  When I set the "False" choice of var "case.covid_hearing_date_assigned" to "true"
  #When I t#ap the var "case.covid_hearing_date_assigned" with the value "False"
  When I tap to continue
  Then the question id should be "case postponed"
  When I tap to continue
  Then the question id should be "eviction reason"
  # Fault branch-off
  When I set the "fault" choice of var "eviction_all_reasons" to "true"
  #When I t#ap the var "eviction_all_reasons" with the value "fault"
  When I tap to continue
  Then the question id should be "fault reason"
  When I set the "overcrowding" choice of var "fault_basis" to "true"
  #When I t#ap the var "fault_basis" with the value "overcrowding"
  When I tap to continue
  Then the question id should be "defense overview"
  When I tap to continue
  Then the question id should be "covid-19"
  When I set the "False" choice of var "covid_cdc_moratorium" to "true"
  #When I t#ap the var "covid_cdc_moratorium" with the value "False"
  And I tap to continue
  Then the question id should be "tenant facts"
  When I tap to continue
  Then the question id should be "rental agreement"
  When I set the var "facts.tenant_movein" to "01/01/2019"
  And I set the var "facts.tenant_rent_share" to "1"
  And I set the var "facts.tenant_rent_frequency" to "week"
  And I set the var "tenancy_type" to "lease"
  And I tap to continue
  And I wait 2 seconds
  Then the question id should be "tenancy facts"
  When I tap to continue
  Then the question id should be "notice to quit facts"
  When I set the var "notice_type" to "fourteen_day"
  When I set the "True" choice of var "ntq_includes_tenant_name" to "true"
  #And I t#ap the var "ntq_includes_tenant_name" with the value "True"
  When I set the "True" choice of var "ntq_includes_all_tenants" to "true"
  #And I t#ap the var "ntq_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "ntq_includes_correct_address" to "true"
  #And I t#ap the var "ntq_includes_correct_address" with the value "True"
  And I tap to continue
  Then the question id should be "lease type"
  When I set the var "lease_type" to "fixed_term"
  When I set the var "lease_end_date" to "01/01/2026"
  And I tap to continue
  Then the question id should be "notice timing"
  When I set the var "date_received_ntq" to "01/01/2020"
  And I set the var "date_received_summons" to "02/01/2020"
  And I tap to continue
  Then the question id should be "nonpayment defenses"
  When I set the "False" choice of var "behind_in_rent" to "true"
  #When I t#ap the var "behind_in_rent" with the value "False"
  And I tap to continue
  Then the question id should be "summons facts"
  When I set the "True" choice of var "ntq_matches_summons" to "true"
  #When I t#ap the var "ntq_matches_summons" with the value "True"
  When I set the "True" choice of var "summons_includes_all_tenants" to "true"
  #And I t#ap the var "summons_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "summons_includes_correct_address" to "true"
  #And I t#ap the var "summons_includes_correct_address" with the value "True"
  When I tap to continue
  Then the question id should be "waiver"
  When I tap to continue
  Then the question id should be "have a defense"
  When I tap to continue
  Then the question id should be "retaliation splash"
  When I set the var "retaliation.is_retaliated" to "False"
  Then the question id should be "discrimination splash"
  When I set the var "tenant.is_discriminated" to "False"
  Then the question id should be "fault defenses"
  When I tap to continue
  Then the question id should be "jury trial"
  When I set the var "claim_jurytrial" to "False"
  Then the question id should be "time to move"
  When I set the var "needs_time_because" to "Busy"
  And I tap to continue
  Then the question id should be "almost done"
  When I tap to continue
  Then the question id should be "discovery"
  When I set the var "tenant_review_discovery" to "False"
  Then the question id should be "signature"
  When I set the var "signature_choice" to "this device"
  And I sign
  And I tap to continue
  Then the question id should be "method of service"
  When I set the var "method_of_service" to "emailed"
  And I set the var "service_date" to "01/01/2024"
  And I tap to continue
  Then the question id should be "intake opener"
  #When I set the var "ask_intake_questions" to "skip"
  #Then the question id should be "download screen"
  #Then I download "Eviction_Forms.zip"

Scenario: User has a public housing voucher with a court date
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  When I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "summons" choice of var "case.status" to "true"
  When I tap to continue
  Then the question id should be "address"
  When I set the address of the var "tenant" to "112 Southampton St., Unit 1, Boston, MA 02118"
  When I set the "True" choice of var "facts.tenant_address_is_eviction_address" to "true"
  And I tap to continue
  Then the question id should be "your name"
  When I set the name of the variable "tenant" to "Uli Ula Ulther III"
  And I tap to continue
  Then the question id should be "additional tenants"
  When I set the var "additional_tenants.there_are_any" to "False"
  Then the question id should be "how named on summons"
  When I set the "False" choice of var "tenant.name_different_on_summons" to "true"
  #When I t#ap the var "tenant.name_different_on_summons" with the value "False"
  When I tap to continue
  Then the question id should be "reminders"
  When I set the var "remind_user" to "true"
  #When I t#ap the checkbox var "remind_user"
  When I set the var "survey_user" to "true"
  #And I t#ap the checkbox var "survey_user"
  When I set the var "edit_contact_info" to "true"
  #And I t#ap the checkbox var "edit_contact_info"
  When I tap to continue
  Then the question id should be "landlords name"
  When I set the var "landlord.name.text" to "Len Lessor"
  When I tap to continue
  Then the question id should be "landlord information"
  When I tap to continue
  Then the question id should be "landlords attorney"
  When I tap to continue
  Then the question id should be "court information"
  When I tap to continue
  Then the question id should be "court date"
  When I set the "True" choice of var "case.covid_hearing_date_assigned" to "true"
  #When I t#ap the var "case.covid_hearing_date_assigned" with the value "True"
  And I set the var "case.covid_first_event" to "01/01/2025"
  When I tap to continue
  Then the question id should be "eviction reason"
  When I set the "nonpayment" choice of var "eviction_all_reasons" to "true"
  #When I t#ap the checkbox var "eviction_all_reasons" with the value "nonpayment"
  When I tap to continue
  Then the question id should be "defense overview"
  When I tap to continue
  Then the question id should be "covid-19"
  When I set the "False" choice of var "covid_cdc_moratorium" to "true"
  #When I t#ap the var "covid_cdc_moratorium" with the value "False"
  And I tap to continue
  # Subsidy branch-off
  Then the question id should be "tenant facts"
  When I set the var "facts.tenant_has_subsidy" to "true"
  #When I t#ap the var "facts.tenant_has_subsidy"
  And I tap to continue
  Then the question id should be "subsidy facts"
  When I set the "Section 8 voucher" choice of var "subsidy_type" to "true"
  #When I t#ap the var "subsidy_type" with the value "Section 8 voucher"
  And I tap to continue
  Then the question id should be "rental agreement"
  When I set the var "facts.tenant_movein" to "01/01/2019"
  And I set the var "facts.tenant_rent_share" to "1"
  # The below is for subsidies
  And I set the var "facts.tenant_contract_rent" to "100"
  And I set the var "facts.tenant_rent_frequency" to "week"
  And I set the var "tenancy_type" to "lease"
  And I tap to continue
  And I wait 2 seconds
  Then the question id should be "notice to quit facts"
  When I tap to continue
  Then the question id should be "nonpayment defenses"
  When I set the "True" choice of var "behind_in_rent" to "true"
  #When I t#ap the var "behind_in_rent" with the value "True"
  When I tap to continue
  Then the question id should be "lease type"
  When I set the var "lease_type" to "self_extending"
  And I tap to continue
  Then the question id should be "notice timing"
  When I set the var "date_received_ntq" to "01/01/2020"
  And I set the var "date_received_summons" to "01/02/2020"
  And I tap to continue
  Then the question id should be "summons facts"
  When I set the "True" choice of var "ntq_matches_summons" to "true"
  #When I t#ap the var "ntq_matches_summons" with the value "True"
  When I set the "True" choice of var "summons_includes_all_tenants" to "true"
  #And I t#ap the var "summons_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "summons_includes_correct_address" to "true"
  #And I t#ap the var "summons_includes_correct_address" with the value "True"
  When I tap to continue
  Then the question id should be "nonpayment cure"
  When I tap to continue
  Then the question id should be "waiver"
  When I tap to continue
  Then the question id should be "have a defense"
  When I tap to continue
  Then the question id should be "tenancy facts"
  When I tap to continue
  # Just for subsidy?
  Then the question id should be "subsidy defenses 2"
  When I set the "False" choice of var "subsidized_housing.no_ntq_to_agency" to "true"
  #When I t#ap the var "subsidized_housing.no_ntq_to_agency" with the value "False"
  And I tap to continue
  Then the question id should be "subsidy defenses 1"
  And I tap to continue
  # End just for subsidy
  Then the question id should be "bad conditions"
  # The below doesn't really need "None", but it's probably a bit confusing otherwise
  When I set the var "bad_conditions.conditions" to "true"
  #When I t#ap the var "bad_conditions.conditions"
  And I tap to continue
  Then the question id should be "retaliation splash"
  When I set the var "retaliation.is_retaliated" to "False"
  Then the question id should be "discrimination splash"
  When I set the var "tenant.is_discriminated" to "False"
  Then the question id should be "consumer protection"
  When I tap to continue
  Then the question id should be "jury trial"
  When I set the var "claim_jurytrial" to "False"
  Then the question id should be "time to move"
  When I set the var "needs_time_because" to "Busy"
  And I tap to continue
  Then the question id should be "almost done"
  When I tap to continue
  Then the question id should be "discovery"
  When I set the var "tenant_review_discovery" to "False"
  Then the question id should be "signature"
  When I set the var "signature_choice" to "this device"
  And I sign
  And I tap to continue
  Then the question id should be "method of service"
  When I set the var "method_of_service" to "emailed"
  And I set the var "service_date" to "01/01/2024"
  And I tap to continue
  Then the question id should be "intake opener"
  #When I set the var "ask_intake_questions" to "skip"
  #Then the question id should be "download screen"
  #Then I download "Eviction_Forms.zip"

Scenario: User fell behind because of RAFT delay
  Given I start the interview at "eviction"
  Then the question id should be "intro screen"
  When I set the "user_accepts" choice of var "acknowledged_information_use" to "true"
  When I tap to continue
  Then the question id should be "who is using"
  When I set the var "person_answering" to "tenant"
  Then the question id should be "how to answer"
  When I set the var "how_to_answer" to "continue"
  Then the question id should be "tenant rights"
  When I tap to continue
  Then the question id should be "your eviction case"
  When I set the "summons" choice of var "case.status" to "true"
  When I tap to continue
  Then the question id should be "address"
  When I set the address of the var "tenant" to "112 Southampton St., Unit 1, Boston, MA 02118"
  When I set the "True" choice of var "facts.tenant_address_is_eviction_address" to "true"
  And I tap to continue
  Then the question id should be "your name"
  When I set the name of the variable "tenant" to "Uli Ula Ulther III"
  And I tap to continue
  Then the question id should be "additional tenants"
  When I set the var "additional_tenants.there_are_any" to "False"
  Then the question id should be "how named on summons"
  When I set the "False" choice of var "tenant.name_different_on_summons" to "true"
  #When I t#ap the var "tenant.name_different_on_summons" with the value "False"
  When I tap to continue
  Then the question id should be "reminders"
  When I set the var "remind_user" to "true"
  #When I t#ap the checkbox var "remind_user"
  When I set the var "survey_user" to "true"
  #And I t#ap the checkbox var "survey_user"
  When I set the var "edit_contact_info" to "true"
  #And I t#ap the checkbox var "edit_contact_info"
  When I tap to continue
  Then the question id should be "landlords name"
  When I set the var "landlord.name.text" to "Len Lessor"
  When I tap to continue
  Then the question id should be "landlord information"
  When I tap to continue
  Then the question id should be "landlords attorney"
  When I tap to continue
  Then the question id should be "court information"
  When I tap to continue
  Then the question id should be "court date"
  When I set the "True" choice of var "case.covid_hearing_date_assigned" to "true"
  #When I t#ap the var "case.covid_hearing_date_assigned" with the value "True"
  And I set the var "case.covid_first_event" to "01/01/2025"
  When I tap to continue
  Then the question id should be "eviction reason"
  When I set the "nonpayment" choice of var "eviction_all_reasons" to "true"
  #When I t#ap the checkbox var "eviction_all_reasons" with the value "nonpayment"
  When I tap to continue
  Then the question id should be "defense overview"
  When I tap to continue
  Then the question id should be "covid-19"
  When I set the "False" choice of var "covid_cdc_moratorium" to "true"
  #When I t#ap the var "covid_cdc_moratorium" with the value "False"
  When I set the "True" choice of var "delay_in_raft" to "true"
  #And I t#ap the var "delay_in_raft" with the value "True"
  And I tap to continue
  Then the question id should be "tenant facts"
  When I tap to continue
  Then the question id should be "rental agreement"
  When I set the var "facts.tenant_movein" to "01/01/2019"
  And I set the var "facts.tenant_rent_share" to "1"
  And I set the var "facts.tenant_rent_frequency" to "month"
  And I set the var "tenancy_type" to "lease"
  And I tap to continue
  And I wait 2 seconds
  Then the question id should be "notice to quit facts"
  When I set the var "notice_type" to "fourteen_day"
  When I set the "True" choice of var "ntq_includes_tenant_name" to "true"
  #And I t#ap the var "ntq_includes_tenant_name" with the value "True"
  When I set the "True" choice of var "ntq_includes_all_tenants" to "true"
  #And I t#ap the var "ntq_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "ntq_includes_correct_address" to "true"
  #And I t#ap the var "ntq_includes_correct_address" with the value "True"
  And I tap to continue
  Then the question id should be "nonpayment defenses"
  When I set the "True" choice of var "behind_in_rent" to "true"
  #When I t#ap the var "behind_in_rent" with the value "True"
  And I tap to continue
  Then the question id should be "tenancy facts"
  When I tap to continue
  Then the question id should be "lease type"
  When I set the var "lease_type" to "fixed_term"
  When I set the var "lease_end_date" to "01/01/2026"
  And I tap to continue
  Then the question id should be "notice timing"
  When I set the var "date_received_ntq" to "01/01/2020"
  And I set the var "date_received_summons" to "02/01/2020"
  And I tap to continue
  Then the question id should be "summons facts"
  When I set the "True" choice of var "ntq_matches_summons" to "true"
  #When I t#ap the var "ntq_matches_summons" with the value "True"
  When I set the "True" choice of var "summons_includes_all_tenants" to "true"
  #And I t#ap the var "summons_includes_all_tenants" with the value "True"
  When I set the "True" choice of var "summons_includes_correct_address" to "true"
  #And I t#ap the var "summons_includes_correct_address" with the value "True"
  When I tap to continue
  Then the question id should be "nonpayment cure"
  When I tap to continue
  Then the question id should be "waiver"
  When I tap to continue
  Then the question id should be "have a defense"
  When I tap to continue
  Then the question id should be "bad conditions"
  # The below doesn't really need "None", but it's probably a bit confusing otherwise
  When I set the var "bad_conditions.conditions" to "true"
  #When I t#ap the var "bad_conditions.conditions"
  And I tap to continue
  Then the question id should be "retaliation splash"
  When I set the var "retaliation.is_retaliated" to "False"
  Then the question id should be "discrimination splash"
  When I set the var "tenant.is_discriminated" to "False"
  Then the question id should be "consumer protection"
  When I tap to continue
  Then the question id should be "jury trial"
  When I set the var "claim_jurytrial" to "False"
  Then the question id should be "time to move"
  When I set the var "needs_time_because" to "Busy"
  And I tap to continue
  Then the question id should be "almost done"
  When I tap to continue
  Then the question id should be "discovery"
  When I set the var "tenant_review_discovery" to "False"
  Then the question id should be "signature"
  When I set the var "signature_choice" to "this device"
  And I sign
  And I tap to continue
  Then the question id should be "method of service"
  When I set the var "method_of_service" to "emailed"
  And I set the var "service_date" to "01/01/2024"
  And I tap to continue
  Then the question id should be "intake opener"
  #When I set the var "ask_intake_questions" to "skip"
  #Then the question id should be "download screen"
  #Then I download "Eviction_Forms.zip"
