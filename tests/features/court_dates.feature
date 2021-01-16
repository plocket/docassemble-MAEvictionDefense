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

@short @1
Scenario: User's court date has passed
  Given I start the interview at "eviction"
  And the user gets to "not right interview" with this data:
    | var | choice | value |
    | acknowledged_information_use | user_accepts | true |
    | person_answering |  | tenant |
    | how_to_answer |  | continue |
    | case.status | late | true |

@long @2
Scenario: User has a federal mortgage and a 14 day notice to quit
  Given I start the interview at "eviction"
  And the user gets to "download screen" with this data:
  | var | choice | value |
  | acknowledged_information_use | user_accepts | true |
  | person_answering |  | tenant |
  | how_to_answer |  | continue |
  | case.status | summons | true |
  | tenant.address.address |  | 112 Southampton St. |
  | tenant.address.unit |  | 1 |
  | tenant.address.city |  | Boston |
  | tenant.address.state |  | MA |
  | tenant.address.zip |  | 02118 |
  | facts.tenant_address_is_eviction_address | True | true |
  | tenant.name.first |  | Uli |
  | tenant.name.middle |  | Ula |
  | tenant.name.last |  | Ulther |
  | tenant.name.suffix |  | III |
  | additional_tenants.there_are_any |  | False |
  | tenant.name_different_on_summons | False | true |
  | remind_user |  | false |
  | survey_user |  | false |
  | edit_contact_info |  | false |
  | landlord.name.text |  | Len Lessor |
  | landlord.is_new |  | false |
  | landlord.has_attorney | False | true |
  | case.covid_hearing_date_assigned | True | true |
  | case.covid_first_event |  | 01/01/2025 |
  | eviction_all_reasons | nonpayment | true |
  | covid_cares_has_federal_mortgage |  | true |
  | covid_cdc_moratorium | False | true |
  | facts.tenant_movein |  | 01/01/2019 |
  | facts.tenant_rent_share |  | 1 |
  | facts.tenant_rent_frequency |  | month |
  | tenancy_type |  | lease |
  | notice_type |  | fourteen_day |
  | ntq_includes_tenant_name | True | true |
  | ntq_includes_all_tenants | True | true |
  | ntq_includes_correct_address | True | true |
  | dont_owe_rent | True | true |
  | behind_in_rent | True | true |
  | lease_type |  | fixed_term |
  | lease_end_date |  | 01/01/2026 |
  | date_received_ntq |  | 01/01/2020 |
  | date_received_summons |  | 02/01/2020 |
  | ntq_matches_summons | True | true |
  | summons_includes_all_tenants | True | true |
  | summons_includes_correct_address | True | true |
  | ntq_contains_reservation | True | true |
  | bad_conditions.conditions |  | true |
  | retaliation.is_retaliated |  | False |
  | tenant.is_discriminated |  | False |
  | claim_jurytrial |  | False |
  | needs_time_because |  | Busy |
  | tenant_review_discovery |  | False |
  | signature_choice |  | this device |
  | method_of_service |  | emailed |
  | service_date |  | 01/01/2024 |
  | | | /sign |
  | ask_intake_questions |  | skip |
  Then I download "Eviction_Forms.zip"

@long @3
Scenario: User has NO federal mortgage, but HAS filed the CDC declaration
  Given I start the interview at "eviction"
  And the user gets to "download screen" with this data:
  | var | choice | value |
  | acknowledged_information_use | user_accepts | true |
  | person_answering |  | tenant |
  | how_to_answer |  | continue |
  | case.status | summons | true |
  | tenant.address.address |  | 112 Southampton St. |
  | tenant.address.unit |  | 1 |
  | tenant.address.city |  | Boston |
  | tenant.address.state |  | MA |
  | tenant.address.zip |  | 02118 |
  | facts.tenant_address_is_eviction_address | True | true |
  | tenant.name.first |  | Uli |
  | tenant.name.middle |  | Ula |
  | tenant.name.last |  | Ulther |
  | tenant.name.suffix |  | III |
  | additional_tenants.there_are_any |  | False |
  | tenant.name_different_on_summons | False | true |
  | remind_user |  | false |
  | survey_user |  | false |
  | edit_contact_info |  | false |
  | landlord.name.text |  | Len Lessor |
  | landlord.is_new |  | false |
  | landlord.has_attorney | False | true |
  | case.covid_hearing_date_assigned | True | true |
  | case.covid_first_event |  | 01/01/2025 |
  | eviction_all_reasons | nonpayment | true |
  | covid_cares_has_federal_mortgage |  | false |
  | covid_cdc_moratorium | True | true |
  | facts.tenant_movein |  | 01/01/2019 |
  | facts.tenant_rent_share |  | 1 |
  | facts.tenant_rent_frequency |  | month |
  | tenancy_type |  | lease |
  | notice_type |  | fourteen_day |
  | ntq_includes_tenant_name | True | true |
  | ntq_includes_all_tenants | True | true |
  | ntq_includes_correct_address | True | true |
  | dont_owe_rent | True | true |
  | behind_in_rent | True | true |
  | lease_type |  | fixed_term |
  | lease_end_date |  | 01/01/2026 |
  | date_received_ntq |  | 01/01/2020 |
  | date_received_summons |  | 02/01/2020 |
  | ntq_matches_summons | True | true |
  | summons_includes_all_tenants | True | true |
  | summons_includes_correct_address | True | true |
  | ntq_contains_reservation | True | true |
  | bad_conditions.conditions |  | true |
  | retaliation.is_retaliated |  | False |
  | tenant.is_discriminated |  | False |
  | claim_jurytrial |  | False |
  | needs_time_because |  | Busy |
  | tenant_review_discovery |  | False |
  | signature_choice |  | this device |
  | method_of_service |  | emailed |
  | service_date |  | 01/01/2024 |
  | | | /sign |
  | ask_intake_questions |  | skip |
  Then I download "Eviction_Forms.zip"

@long @4
Scenario: User has a "fault" case with NO court date and NO CDC declaration
  Given I start the interview at "eviction"
  And the user gets to "download screen" with this data:
  | var | choice | value |
  | acknowledged_information_use | user_accepts | true |
  | person_answering |  | tenant |
  | how_to_answer |  | continue |
  | case.status | summons | true |
  | tenant.address.address |  | 112 Southampton St. |
  | tenant.address.unit |  | 1 |
  | tenant.address.city |  | Boston |
  | tenant.address.state |  | MA |
  | tenant.address.zip |  | 02118 |
  | facts.tenant_address_is_eviction_address | True | true |
  | tenant.name.first |  | Uli |
  | tenant.name.middle |  | Ula |
  | tenant.name.last |  | Ulther |
  | tenant.name.suffix |  | III |
  | additional_tenants.there_are_any |  | False |
  | tenant.name_different_on_summons | False | true |
  | remind_user |  | false |
  | survey_user |  | false |
  | edit_contact_info |  | false |
  | landlord.name.text |  | Len Lessor |
  | landlord.is_new |  | false |
  | landlord.has_attorney | False | true |
  | case.covid_hearing_date_assigned | False | true |
  | eviction_all_reasons | fault | true |
  | fault_basis | overcrowding | true |
  | covid_cares_has_federal_mortgage |  | false |
  | covid_cdc_moratorium | False | true |
  | facts.tenant_movein |  | 01/01/2019 |
  | facts.tenant_rent_share |  | 1 |
  | facts.tenant_rent_frequency |  | month |
  | tenancy_type |  | lease |
  | notice_type |  | fourteen_day |
  | ntq_includes_tenant_name | True | true |
  | ntq_includes_all_tenants | True | true |
  | ntq_includes_correct_address | True | true |
  | dont_owe_rent | True | true |
  | behind_in_rent | False | true |
  | lease_type |  | fixed_term |
  | lease_end_date |  | 01/01/2026 |
  | date_received_ntq |  | 01/01/2020 |
  | date_received_summons |  | 02/01/2020 |
  | ntq_matches_summons | True | true |
  | summons_includes_all_tenants | True | true |
  | summons_includes_correct_address | True | true |
  | ntq_contains_reservation | True | true |
  | bad_conditions.conditions |  | true |
  | retaliation.is_retaliated |  | False |
  | tenant.is_discriminated |  | False |
  | claim_jurytrial |  | False |
  | needs_time_because |  | Busy |
  | tenant_review_discovery |  | False |
  | signature_choice |  | this device |
  | method_of_service |  | emailed |
  | service_date |  | 01/01/2024 |
  | | | /sign |
  | ask_intake_questions |  | skip |
  Then I download "Eviction_Forms.zip"

## Not sure rent_share is needed, but it was in the original
## How to handle conditional defaults? subsidized_housing.no_ntq_to_agency. Needs to be written into coder's scenario?
@long @5
Scenario: User has a public housing voucher with a court date
  Given I start the interview at "eviction"
  And the user gets to "download screen" with this data:
  | var | choice | value |
  | acknowledged_information_use | user_accepts | true |
  | person_answering |  | tenant |
  | how_to_answer |  | continue |
  | case.status | summons | true |
  | tenant.address.address |  | 112 Southampton St. |
  | tenant.address.unit |  | 1 |
  | tenant.address.city |  | Boston |
  | tenant.address.state |  | MA |
  | tenant.address.zip |  | 02118 |
  | facts.tenant_address_is_eviction_address | True | true |
  | tenant.name.first |  | Uli |
  | tenant.name.middle |  | Ula |
  | tenant.name.last |  | Ulther |
  | tenant.name.suffix |  | III |
  | additional_tenants.there_are_any |  | False |
  | tenant.name_different_on_summons | False | true |
  | remind_user |  | false |
  | survey_user |  | false |
  | edit_contact_info |  | false |
  | landlord.name.text |  | Len Lessor |
  | landlord.is_new |  | false |
  | landlord.has_attorney | False | true |
  | case.covid_hearing_date_assigned | True | true |
  | case.covid_first_event |  | 01/01/2025 |
  | eviction_all_reasons | nonpayment | true |
  | covid_cares_has_federal_mortgage |  | false |
  | covid_cdc_moratorium | False | true |
  | facts.tenant_has_subsidy |  | true |
  | subsidy_type | Section 8 voucher | true |
  | facts.tenant_movein |  | 01/01/2019 |
  | facts.tenant_rent_share |  | 1 |
  | facts.tenant_contract_rent |  | 10 |
  | facts.tenant_rent_frequency |  | month |
  | tenancy_type |  | lease |
  | notice_type |  | fourteen_day |
  | ntq_includes_tenant_name | True | true |
  | ntq_includes_all_tenants | True | true |
  | ntq_includes_correct_address | True | true |
  | dont_owe_rent | True | true |
  | behind_in_rent | True | true |
  | lease_type |  | self_extending |
  | date_received_ntq |  | 01/01/2020 |
  | date_received_summons |  | 02/01/2020 |
  | ntq_matches_summons | True | true |
  | summons_includes_all_tenants | True | true |
  | summons_includes_correct_address | True | true |
  | ntq_contains_reservation | True | true |
  | subsidized_housing.no_proper_termination | True | true |
  | subsidized_housing.no_just_cause | True | true |
  | subsidized_housing.no_ntq_to_agency | False | true |
  | bad_conditions.conditions |  | true |
  | retaliation.is_retaliated |  | False |
  | tenant.is_discriminated |  | False |
  | claim_jurytrial |  | False |
  | needs_time_because |  | Busy |
  | tenant_review_discovery |  | False |
  | signature_choice |  | this device |
  | method_of_service |  | emailed |
  | service_date |  | 01/01/2024 |
  | | | /sign |
  | ask_intake_questions |  | skip |
  Then I download "Eviction_Forms.zip"

@long @6
Scenario: User fell behind because of RAFT delay
  Given I start the interview at "eviction"
  And the user gets to "download screen" with this data:
  | var | choice | value |
  | acknowledged_information_use | user_accepts | true |
  | person_answering |  | tenant |
  | how_to_answer |  | continue |
  | case.status | summons | true |
  | tenant.address.address |  | 112 Southampton St. |
  | tenant.address.unit |  | 1 |
  | tenant.address.city |  | Boston |
  | tenant.address.state |  | MA |
  | tenant.address.zip |  | 02118 |
  | facts.tenant_address_is_eviction_address | True | true |
  | tenant.name.first |  | Uli |
  | tenant.name.middle |  | Ula |
  | tenant.name.last |  | Ulther |
  | tenant.name.suffix |  | III |
  | additional_tenants.there_are_any |  | False |
  | tenant.name_different_on_summons | False | true |
  | remind_user |  | false |
  | survey_user |  | false |
  | edit_contact_info |  | false |
  | landlord.name.text |  | Len Lessor |
  | landlord.is_new |  | false |
  | landlord.has_attorney | False | true |
  | case.covid_hearing_date_assigned | True | true |
  | case.covid_first_event |  | 01/01/2025 |
  | eviction_all_reasons | nonpayment | true |
  | covid_cares_has_federal_mortgage |  | false |
  | covid_cdc_moratorium | True | true |
  | delay_in_raft | True | true |
  | facts.tenant_movein |  | 01/01/2019 |
  | facts.tenant_rent_share |  | 1 |
  | facts.tenant_rent_frequency |  | month |
  | tenancy_type |  | lease |
  | notice_type |  | fourteen_day |
  | ntq_includes_tenant_name | True | true |
  | ntq_includes_all_tenants | True | true |
  | ntq_includes_correct_address | True | true |
  | dont_owe_rent | True | true |
  | behind_in_rent | True | true |
  | lease_type |  | fixed_term |
  | lease_end_date |  | 01/01/2026 |
  | date_received_ntq |  | 01/01/2020 |
  | date_received_summons |  | 02/01/2020 |
  | ntq_matches_summons | True | true |
  | summons_includes_all_tenants | True | true |
  | summons_includes_correct_address | True | true |
  | ntq_contains_reservation | True | true |
  | bad_conditions.conditions |  | true |
  | retaliation.is_retaliated |  | False |
  | tenant.is_discriminated |  | False |
  | claim_jurytrial |  | False |
  | needs_time_because |  | Busy |
  | tenant_review_discovery |  | False |
  | signature_choice |  | this device |
  | method_of_service |  | emailed |
  | service_date |  | 01/01/2024 |
  | | | /sign |
  | ask_intake_questions |  | skip |
  Then I download "Eviction_Forms.zip"
