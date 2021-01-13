# question_id is YYYY.MM.SECTION.QUESTION. For tests never administered, YYYY
# is 0000 and MM reflects the test question

  Question.create!(
  question_id: "0000.01.3.01 ",
  prompt: "If x-1 / 3 = k and k = 3, what is the value of x?",
  A: "2",
  B: "4",
  C: "9",
  D: "10",
  answer_value: "D",
  answer_explanation: 
      "Since k=3, one can substitute 3 for k in the equation x-1//3 = k, which
      gives x-1/3=3. Multiplying both sides of x-1/3=3 by 3 gives x-1=9 and then
      adding 1 to both sides of x-1=9 gives x = 10.
      <br>
      Choices A, B, and C are incorrect because the result of subtracting 1 from
      the value and dividing by 3 is not the given value of k, which is 3."
  )

  Question.create!(
  question_id: "0000.01.3.02",
  prompt: "For i = sqrt(-1), what is the sum (7 + 3i) + (-8 + 9i)?",
  A: "-1 + 12i",
  B: "-1 - 6i",
  C: "15 + 12i",
  D: "15 - 6i",
  answer_value: "A",
  answer_explanation: 
      "To calculate (7 + 3i + (-8 + 9i)), add the real parts of each complex 
      number, and the add the imaginary parts, 3i+9i=12i. The result is -1+12i.
      <br>
      Choices B, C, and D are incorrect and likely result from common errors
      that arise when adding complex numbers. For example, choice B is
      the result of adding 3i and -9i, and choice C is the result of adding 7
      and 8."
  )

  Question.create!(
  question_id: "0000.01.3.03",
  prompt: 
    "On Saturday afternoon, Armand sent <em>m</em> test messages each hour for 5
    hours, and Tyrone sent <em>p</em> test messages each hour for 4 hours. Which
    of the following represents the total number of messages sent by Armand and
    Tryone on Saturday afternoon?",
  A: "9<em>mp</em>",
  B: "20<em>mp</em>",
  C: "5<em>m</em> + 4<em>p</em>",
  D: "4<em>m</em> + 5<em>p</em>",
  answer_value: "C",
  answer_explanation: 
      "The total number of text messages sent by Armand can be found by
      multiplying his rate of texting, in number of text messages sent per hour, 
      by the total number of hours he spent sending them; that is 􀁐 texts/hour 
      × 5 hours = 5m texts. Similarly, the total number of text messages sent by
      Tyrone is his hourly rate of texting multiplied by the 4 hours he spent 
      texting: p texts/hour × 4 hours = 4􀁓 texts. The total number of text 
      messages sent by Armand and Tyrone is the sum of the total number of 
      messages sent by Armand and the total number of messages sent by Tyrone: 
      5m + 4p.
      <br>
      Choice A is incorrect and arises from adding the coefficients and
      multiplying the variables of 5􀁐 and 4􀁓. Choice B is incorrect and is
      the result of multiplying 5􀁐 and 4􀁓. The total number of messages
      sent by Armand and Tyrone should be the sum of 5􀁐 and 4􀁓, not the
      product of these terms. Choice D is incorrect because it multiplies
      Armand’s number of hours spent texting by Tyrone’s hourly rate of
      texting, and vice versa. This mix-up results in an expression that
      does not equal the total number of messages sent by Armand and Tyrone."
  )

