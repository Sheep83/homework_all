package com.codeclan.example.starwarseightball;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.view.View;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Random;

/**
 * Created by user on 16/08/2016.
 */
public class StarWarsEightBall extends AppCompatActivity {
    EditText mQuestionEditText;
    Button mYodaButton;
    Button mVaderButton;
    TextView mYodaAnswer;
    TextView mVaderAnswer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mQuestionEditText = (EditText)findViewById(R.id.question_text);
        mYodaButton = (Button)findViewById(R.id.yoda_button);
        mVaderButton = (Button)findViewById(R.id.vader_button);

        mYodaButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String question=mQuestionEditText.getText().toString();
                Intent intent = new Intent(StarWarsEightBall.this, YodaAnswer.class);
                String yodaAnswer = yodaAnswer();
                intent.putExtra("yoda_answer", yodaAnswer);
                Log.d("StarWarsEightball:", "passing through '" + yodaAnswer + "'");
                startActivity(intent);
            }
        });

        mVaderButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String question=mQuestionEditText.getText().toString();
                Intent intent = new Intent(StarWarsEightBall.this, VaderAnswer.class);
                String vaderAnswer = vaderAnswer();
                intent.putExtra("vader_answer", vaderAnswer);
                startActivity(intent);
            }
        });

    }

    public String yodaAnswer(){
        ArrayList<String> yodaAnswers = new ArrayList<>();
        Random rand = new Random();
        yodaAnswers.add("No, try not. Do or do not, there is no try.");
        yodaAnswers.add("Help you I can.");
        yodaAnswers.add("Wars not make one great.");
        yodaAnswers.add("You must unlearn what you have learned.");
        int  n = rand.nextInt(yodaAnswers.size());
        return  yodaAnswers.get(n);

    }

    public String vaderAnswer(){
        ArrayList<String> vaderAnswers = new ArrayList<>();
        Random rand = new Random();
        vaderAnswers.add("I must obey my master.");
        vaderAnswers.add("There is no conflict.");
        vaderAnswers.add("I find your lack of faith disturbing.");
        vaderAnswers.add("No, I am your father");
        int  n = rand.nextInt(vaderAnswers.size());
        return  vaderAnswers.get(n);

    }
}
