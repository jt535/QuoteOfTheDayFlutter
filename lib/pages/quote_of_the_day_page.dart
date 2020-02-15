

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/pages/quote_of_the_day_page_view_model.dart';
import 'package:quote_of_the_day/widgets/error_message.dart';
import 'package:quote_of_the_day/widgets/full_quote_details.dart';
import 'package:quote_of_the_day/widgets/loading_message.dart';
import 'package:quote_of_the_day/widgets/rolling_gradient_background.dart';

class QuoteOfTheDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: RollingGradient(child:
            Consumer<QuoteOfTheDayPageViewModel>(builder: (context, repository, child) {
              if (repository.error != null) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true),
                    child: Center(child: ErrorMessage(error: repository.error,)));
              } else if (!repository.isLoading && repository.quoteResponse != null) {
                return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true),
                    onDoubleTap: () => Provider.of<QuoteOfTheDayPageViewModel>(context).reload(force: true, fakeDelay: true),
                    onLongPress: () => Provider.of<QuoteOfTheDayPageViewModel>(context).forceError(),
                    child: FullQuoteDetails(quoteResponse: repository.quoteResponse,));
              } else {
                return Center(child: LoadingMessage());
              }
            }),
        )
    );
  }
}