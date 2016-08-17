package com.codeclan.example.starwarseightball;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by user on 16/08/2016.
 */

public class YodaAnswer extends AppCompatActivity {
    TextView mAnswerText;
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.yoda_activity_answer);


        mAnswerText = (TextView)findViewById(R.id.yoda_answer);

        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        String answer = extras.getString("yoda_answer");
        mAnswerText.setText(answer);
    }
}