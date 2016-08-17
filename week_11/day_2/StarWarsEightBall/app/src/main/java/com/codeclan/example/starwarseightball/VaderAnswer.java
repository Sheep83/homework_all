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
public class VaderAnswer extends AppCompatActivity {
    TextView mAnswerText;
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.vader_activity_answer);

        mAnswerText = (TextView)findViewById(R.id.vader_answer);

        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        String answer = extras.getString("vader_answer");
        mAnswerText.setText(answer);
    }
}
