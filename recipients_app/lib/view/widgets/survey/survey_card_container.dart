import "package:app/data/models/survey/survey_card_status.dart";
import "package:app/data/models/survey/survey_ui_state.dart";
import "package:app/ui/configs/configs.dart";
import "package:app/view/widgets/survey/survey_card_bottom_action.dart";
import "package:flutter/material.dart";

class SurveyCard extends StatelessWidget {
  const SurveyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: AppSpacings.a16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "12 months survey",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/survey-widget.gif"),
                      height: 134,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Please take 5 minutes to answer 15 questions and help to improve Social Income",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SurveyCardBottomAction(
            surveyUiState: SurveyUiState(
              status: SurveyCardStatus.newSurvey,
              daysToDeadline: 10,
            ),
          ),
          const SurveyCardBottomAction(
            surveyUiState: SurveyUiState(
              status: SurveyCardStatus.stillSomeTime,
              daysToDeadline: 4,
            ),
          ),
          const SurveyCardBottomAction(
            surveyUiState: SurveyUiState(
              status: SurveyCardStatus.closeToDeadline,
              daysToDeadline: 2,
            ),
          ),
          const SurveyCardBottomAction(
            surveyUiState: SurveyUiState(
              status: SurveyCardStatus.missed,
              daysToDeadline: 0,
            ),
          ),
          SurveyCardBottomAction(
            surveyUiState: SurveyUiState(
              status: SurveyCardStatus.answered,
              daysToDeadline: 0,
              answeredDate: DateTime.now().add(const Duration(days: -10)),
            ),
          ),
        ],
      ),
    );
  }
}
