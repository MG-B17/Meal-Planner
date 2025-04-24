import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utilies/widgets/unexpected_error.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/AppBar.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/empty_chat_widget.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/geminiResponse.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/loading.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/textFormFiled.dart';
import 'package:meal_planner/features/gemini_chat/presentation/widget/userMessage.dart';
import 'controller/cubit.dart';
import 'controller/states.dart';



class GeminiChat extends StatelessWidget {

  ScrollController scrollController = ScrollController();

  TextEditingController geminiController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeminiChatCubit,GeminiChatStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = GeminiChatCubit.get(context);
        return  Scaffold(
          appBar: GeminiAppBar(context: context),
          body:Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cubit.userMessage.isNotEmpty?UserMessage(message: cubit.userMessage[0]):EmptyChatWidget(),
                        state is LoadingSearch? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            geminiSpinKit,
                          ],
                        ) : SizedBox(),
                        state is GeminiSearchSuccess ?GeminiResponse(
                            image: state.geminiResponse.image,
                            recipeName:state.geminiResponse.recipeName,
                            numOfIngredients: state.geminiResponse.numberOfIngredients,
                            time:state.geminiResponse.totalTime,
                          ingredients:state.geminiResponse.ingredients,
                          direction: state.geminiResponse.direction,
                          fat: state.geminiResponse.fat,
                          protein: state.geminiResponse.protein,
                          calories: state.geminiResponse.calories,
                          tittle: state.geminiResponse.tittle,
                          summary: state.geminiResponse.summary,
                          serving: state.geminiResponse.serving,
                        ):SizedBox(),
                        state is GeminiSearchFail ? UnexpectedErrorWidget():SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              
              GeminiTextFormFiled(
                onTap:(){
                  DateTime time=DateTime.now();
                  cubit.geminiChat(recipeName: geminiController.text, sendTime: time.toString());
                  geminiController.clear();
               },
                geminiController: geminiController,
              )
            ],
          ),
        );
      },
    );
  }
}
