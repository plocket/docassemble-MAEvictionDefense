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
    | some_var_name | True | true |
    | acknowledged_information_use | user_accepts | true |
    | additional_tenants.revisit | True | true |
    | additional_tenants.there_are_any | False | false |
    | all_answer_variables | True | true |
    | allow_cron | True | true |
    | almost_done | True | true |
    | always_true | True | true |
    | answer.docx.number |  | 24363 |
    | answer.docx.ok | True | true |
    | answer.info.attachment.name |  | Question_208 |
    | answer.info.attachment.number |  | 0 |
    | answer.info.description |  |  |
    | answer.info.formats[0] |  | docx |
    | answer.info.formats[1] |  | pdf |
    | answer.info.name |  | Answer Form |
    | answer.info.raw | False | false |
    | answer.pdf.number |  | 24364 |
    | answer.pdf.ok | True | true |
    | answer_date_is_holiday | False | false |
    | ask_intake_questions |  | skip |
    | attempted_full_cure | False | false |
    | attempted_offered_cure | False | false |
    | bad_conditions.conditions | cockroaches | false |
    | bad_conditions.conditions | defective ceilings, walls, or floors | false |
    | bad_conditions.conditions | defective locks | false |
    | bad_conditions.conditions | defective or leaky windows | false |
    | bad_conditions.conditions | electrical problems | false |
    | bad_conditions.conditions | insects | false |
    | bad_conditions.conditions | lead paint | false |
    | bad_conditions.conditions | mice or rats | false |
    | bad_conditions.conditions | no heat | false |
    | bad_conditions.conditions | no hot water | false |
    | bad_conditions.conditions | not enough heat | false |
    | bad_conditions.conditions | not enough hot water | false |
    | bad_conditions.conditions | other | false |
    | bad_conditions.conditions | security problems | false |
    | bad_conditions.conditions | water leaks or other plumbing problems | false |
    | bad_conditions.conditions | None | true |
    | bad_conditions.have_conditions | False | false |
    | behind_in_rent | True | true |
    | bqe.entered_without_permission | False | false |
    | bqe.locked_out | False | false |
    | bqe.violated | False | false |
    | case.action_type |  | plaintiff defendant |
    | case.answer_date |  | 12/29/2024 |
    | case.covid_first_event |  | 01/01/2025 |
    | case.covid_hearing_date_assigned | True | true |
    | case.entry_date |  | 12/22/2024 |
    | case.is_solo_action | False | false |
    | case.on_time | True | true |
    | case.original_date |  | 01/01/2025 |
    | case.rescheduled_date |  | 01/01/2025 |
    | case.status |  | summons |
    | case_title |  | Len Lessor v. Uli U. Ulther III |
    | category |  | CARES |
    | claim_discovery_link_url |  | data/sources/claim-discovery-link.csv |
    | claim_jurytrial | False | false |
    | claims.harassment | False | false |
    | claims.utilities | False | false |
    | comparison |  | fourteen_day |
    | compel_discovery_with_instructions.docx.number |  | 24371 |
    | compel_discovery_with_instructions.docx.ok | True | true |
    | compel_discovery_with_instructions.info.attachment.name |  | Question_212 |
    | compel_discovery_with_instructions.info.attachment.number |  | 0 |
    | compel_discovery_with_instructions.info.description |  |  |
    | compel_discovery_with_instructions.info.formats[0] |  | docx |
    | compel_discovery_with_instructions.info.formats[1] |  | pdf |
    | compel_discovery_with_instructions.info.name |  | Motion to Compel Discovery |
    | compel_discovery_with_instructions.info.raw | False | false |
    | compel_discovery_with_instructions.pdf.number |  | 24372 |
    | compel_discovery_with_instructions.pdf.ok | True | true |
    | consumer_protection.late_fees | False | false |
    | consumer_protection.nonagreed_rent | False | false |
    | consumer_protection.other | False | false |
    | consumer_protection.unlawful_court_fees | False | false |
    | consumer_protection.unlawful_lease_terms | False | false |
    | macourts[29].address.address |  | 24 New Chardon St. |
    | macourts[29].address.city |  | Boston |
    | macourts[29].address.county |  | Suffolk County |
    | macourts[29].address.location.known | False | false |
    | macourts[29].address.state |  | MA |
    | macourts[29].address.zip |  | 02114 |
    | macourts[29].court_code |  | H84 |
    | macourts[29].department |  | Housing Court |
    | macourts[29].description |  | The Eastern Division of the Housing Court serves Boston, Brookline    and Newton. |
    | macourts[29].division |  | Eastern |
    | macourts[29].fax |  |  |
    | macourts[29].has_po_box | False | false |
    | macourts[29].location.known | False | false |
    | macourts[29].name |  | Eastern Housing Court |
    | macourts[29].phone |  | (617) 788-8485 |
    | court_date |  | 01/01/2025 |
    | court_date_holiday |  | New Year's Day |
    | court_date_is_holiday | True | true |
    | court_is_housing_court | True | true |
    | cover_letter.docx.number |  | 24361 |
    | cover_letter.docx.ok | True | true |
    | cover_letter.info.attachment.name |  | Question_211 |
    | cover_letter.info.attachment.number |  | 0 |
    | cover_letter.info.description |  |  |
    | cover_letter.info.formats[0] |  | docx |
    | cover_letter.info.formats[1] |  | pdf |
    | cover_letter.info.name |  | Cover Letter |
    | cover_letter.info.raw | False | false |
    | cover_letter.pdf.number |  | 24362 |
    | cover_letter.pdf.ok | True | true |
    | covid_cares_has_federal_mortgage | True | true |
    | covid_cares_mortgage_in_forbearance | False | false |
    | covid_cdc_moratorium | False | true |
    | current_interview_url |  | docassemble.playground42testingtags:eviction.yml |
    | date_discovery_due |  | 01/11/2024 |
    | date_discovery_received |  | 01/01/2024 |
    | date_motion_to_compel_due |  | 01/16/2024 |
    | date_notice_should_be_received_after |  | 01/15/2020 |
    | date_received_ntq |  | 01/01/2020 |
    | date_received_summons |  | 02/01/2020 |
    | default_landlord_type |  | other |
    | default_lang |  |  |
    | defendants_name |  | Uli U. Ulther III |
    | delay_in_raft | False | false |
    | didnt_provide_contact_info | True | true |
    | discovery.docx.number |  | 24367 |
    | discovery.docx.ok | True | true |
    | discovery.info.attachment.name |  | Question_208 |
    | discovery.info.attachment.number |  | 1 |
    | discovery.info.description |  |  |
    | discovery.info.formats[0] |  | docx |
    | discovery.info.formats[1] |  | pdf |
    | discovery.info.name |  | Request for Discovery |
    | discovery.info.raw | False | false |
    | discovery.pdf.number |  | 24368 |
    | discovery.pdf.ok | True | true |
    | discovery_categories[0] |  | Tenancy |
    | discovery_categories[1] |  | Problems with the Apartment/Building |
    | discovery_categories[2] |  | Other |
    | discovery_categories[3] |  | Disability |
    | discovery_categories[4] |  | Subsidized Housing |
    | discovery_categories[5] |  | Security Deposit |
    | discovery_categories[6] |  | Utilities |
    | discovery_categories[7] |  | Facts about the landlord |
    | discovery_categories[8] |  | Landlord's Claims |
    | discovery_categories[9] |  | CARES |
    | discovery_name |  | cares_mortgage |
    | discovery_url |  | data/sources/discovery-map.csv |
    | dont_owe_rent | True | true |
    | download_titles[0] |  | Answer |
    | download_titles[1] |  | Discovery |
    | download_titles_temp[0] |  | Answer |
    | download_titles_temp[1] |  | Discovery |
    | answer.number |  | 24369 |
    | answer.ok | True | true |
    | answer.number |  | 24370 |
    | drq.revisit | True | true |
    | drq.there_are_any | True | true |
    | drq.there_is_another | False | false |
    | edit_contact_info | False | false |
    | eviction_all_reasons | fault | false |
    | eviction_all_reasons | nofault | false |
    | eviction_all_reasons | nonpayment | true |
    | eviction_all_reasons | nontq | false |
    | eviction_all_reasons | unsure | false |
    | eviction_detailed_reason |  | nonpayment of rent |
    | eviction_reason |  | nonpayment |
    | eviction_reason_explanation | True | true |
    | facts.tenant_address_is_eviction_address | True | true |
    | facts.tenant_has_lease | True | true |
    | facts.tenant_has_subsidy | False | false |
    | facts.tenant_movein |  | 01/01/2019 |
    | facts.tenant_rent_frequency |  | month |
    | facts.tenant_rent_share |  | 1 |
    | has_defense | True | true |
    | how_to_answer |  | continue |
    | iname |  | cares_mortgage |
    | initial_defense.cares_act | True | true |
    | initial_defense.cure | False | false |
    | initial_defense.defective_summons | True | true |
    | initial_defense.improper_time_given | False | false |
    | initial_defense.inconsistent_reasons | False | false |
    | initial_defense.need_ntq | True | true |
    | initial_defense.new_tenancy | False | false |
    | initial_defense.no_ntq | False | false |
    | initial_defense.no_proper_termination | False | false |
    | initial_defense.no_standing | False | false |
    | initial_defense.non_essential_eviction | True | true |
    | initial_defense.ntq_defective | False | false |
    | initial_defense.other | False | false |
    | initial_defense.premature_commencement | False | false |
    | initial_defense.summons_missing_information | False | false |
    | initial_defense.summons_served_at_wrong_time | True | true |
    | initial_defense.varney | False | false |
    | instructions.docx.number |  | 24359 |
    | instructions.docx.ok | True | true |
    | instructions.info.attachment.name |  | Question_206 |
    | instructions.info.attachment.number |  | 0 |
    | instructions.info.description |  |  |
    | instructions.info.formats[0] |  | docx |
    | instructions.info.formats[1] |  | pdf |
    | instructions.info.name |  | Instructions and Next Steps |
    | instructions.info.raw | False | false |
    | instructions.pdf.number |  | 24360 |
    | instructions.pdf.ok | True | true |
    | ints.revisit | True | true |
    | ints.there_are_any | True | true |
    | ints.there_is_another | False | false |
    | is_checked | False | false |
    | is_condo_conversion | False | false |
    | is_pca | False | false |
    | item.AlwaysChecked |  |  |
    | item.Category |  | CARES |
    | item.Description |  | All documents related to federally backed mortgage |
    | item.Variable |  | drq.cares_mortgage |
    | key |  | cares_mortgage |
    | landlord.address.location.known | False | false |
    | landlord.has_attorney | False | false |
    | landlord.is_new | False | false |
    | landlord.location.known | False | false |
    | landlord.name.text |  | Len Lessor |
    | landlord.organization_type |  | other |
    | landlords_attorney.address.location.known | False | false |
    | landlords_attorney.location.known | False | false |
    | lease_end_date |  | 01/01/2026 |
    | lease_requires_30_day_notice | False | false |
    | lease_type |  | fixed_term |
    | lemma. |  |  |
    | lemma.Claim |  | notice_type |
    | lemma.Discovery |  | drq.cares_mortgage |
    | lemma.Remarks |  | Covid-25 |
    | lemma.Value |  | fourteen_day |
    | loaded_discovery | True | true |
    | macourts.courts | True | true |
    | macourts.data_path |  | docassemble.MACourts:data/sources/ |
    | macourts.there_are_any | True | true |
    | method_of_service |  | emailed |
    | needs_time_because |  | Busy |
    | no_ntq_in_12_months | False | false |
    | non_essential_eviction | True | true |
    | notice_type |  | fourteen_day |
    | ntq_contains_reservation | True | true |
    | ntq_includes_all_tenants | True | true |
    | ntq_includes_correct_address | True | true |
    | ntq_includes_tenant_name | True | true |
    | ntq_leaves_off_required_language | False | false |
    | ntq_matches_summons | True | true |
    | num_downloads |  | 2 |
    | orig_filename |  | Len Lessor v. Uli U. Ulther III.pdf |
    | other.vendor_payments | False | false |
    | other_drq.revisit | True | true |
    | other_drq.there_are_any | False | false |
    | other_ints.revisit | True | true |
    | other_ints.there_are_any | False | false |
    | overview_video | True | true |
    | paid_court_fees | False | false |
    | paid_deposit | False | false |
    | paid_lmr | False | false |
    | paid_rent_owed | False | false |
    | person_answering |  | tenant |
    | plead_8a | True | true |
    | plead_93a | True | true |
    | plead_counterclaims | True | true |
    | post_ntq_waiver | lease | false |
    | post_ntq_waiver | rent | true |
    | postforeclosure.is_foreclosed | False | false |
    | premature_commencement_test |  | Notice is required for a fixed number of days |
    | prepared_with_aoc | False | false |
    | refused_rent_increase | False | false |
    | remind_user | False | false |
    | required_notice_time |  | 14 |
    | retaliation.is_retaliated | False | false |
    | safe_filename |  | Len_Lessor_v._Uli_U._Ulther_III.pdf |
    | saw_signature_choice | True | true |
    | send_ls_email | True | true |
    | send_user_email | True | true |
    | service_date |  | 01/01/2024 |
    | set_plead_counterclaims | True | true |
    | show_defense_summary |  | continue |
    | show_instructions | True | true |
    | signature_choice |  | this device |
    | speak_text | True | true |
    | started_on_phone | False | false |
    | store_made_snapshot | True | true |
    | summons_in_hand | False | false |
    | summons_includes_all_tenants | True | true |
    | summons_includes_correct_address | True | true |
    | summons_last_and_usual | False | false |
    | summons_mailed | False | false |
    | survey_user | False | false |
    | t_landlord_name |  | len lessor |
    | tenancy_type |  | lease |
    | tenant.address.address |  | 112 Southampton St. |
    | tenant.address.city |  | Boston |
    | tenant.address.country |  | US |
    | tenant.address.county |  | Suffolk County |
    | tenant.address.location.description |  | 112 Southampton St. [NEWLINE] Unit 1 [NEWLINE] Boston, #MA     2118 |
    | tenant.address.location.known | True | true |
    | tenant.address.neighborhood |  | Dorchester |
    | tenant.address.one_line |  | 112 Southampton St #1, Boston, MA 02118, USA |
    | tenant.address.postal_code |  | 02118 |
    | tenant.address.postal_code_suffix |  | 2711 |
    | tenant.address.state |  | MA |
    | tenant.address.street |  | Southampton St |
    | tenant.address.street_number |  | 112 |
    | tenant.address.sublocality_level_5 |  | 1 |
    | tenant.address.unit |  | 1 |
    | tenant.address.zip |  | 02118 |
    | tenant.email |  |  |
    | tenant.is_disabled | False | false |
    | tenant.is_discriminated | False | false |
    | tenant.is_dvvictim | False | false |
    | tenant.is_nonnativespeaker | False | false |
    | tenant.is_over60 | False | false |
    | tenant.is_under6 | False | false |
    | tenant.location.known | False | false |
    | tenant.name.first |  | Uli |
    | tenant.name.last |  | Ulther |
    | tenant.name.middle |  | Ula |
    | tenant.name.suffix |  | III |
    | tenant.name.uses_parts | True | true |
    | tenant.name_different_on_summons | False | false |
    | tenant.phone_number |  |  |
    | tenant.signature.number |  | 24358 |
    | tenant.signature.ok | True | true |
    | tenant_review_discovery | False | false |
    | tenant_type |  | renter |
    | user_cell |  |  |
    | user_email |  |  |
    | user_has_saved_answers | False | false |
    | user_language |  | en |
    | | | /sign |
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
    | | | /sign |
    | | | /sign |
    | ask_intake_questions |  | skip |
  #Then I download "Eviction_Forms.zip"

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
