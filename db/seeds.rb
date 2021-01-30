# question_id is YYYY.MM.SECTION.QUESTION. For tests never administered, YYYY
# is 0000 and MM reflects the test question

  Question.create!(
  question_id: "0000.01.3.01 ",
  prompt: "If \\( \\displaystyle { x-1 \\over 3} = k\\), and \\(k=3\\), what is the value of \\(x\\)?",
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
  prompt: "For \\(i = \\sqrt{\\text{&ndash;}1}\\), what is the sum \\((7 + 3i) + (\\text{&ndash;}8 + 9i)\\)?",
  A: "\\(\\text{&ndash;}1 + 12i\\)",
  B: "\\(\\text{&ndash;}1 - 6i\\)",
  C: "\\(15 + 12i\\)",
  D: "\\(15 - 6i\\)",
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
    "On Saturday afternoon, Armand sent \\(m\\) text messages each hour for 5
    hours, and Tyrone sent \\(p\\) text messages each hour for 4 hours. Which
    of the following represents the total number of messages sent by Armand and
    Tyrone on Saturday afternoon?",
  A: "\\(9mp\\)",
  B: "\\(20mp\\)",
  C: "\\(5m + 4p\\)",
  D: "\\(4m + 5p\\)",
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

  Question.create!(
  question_id: "0000.01.3.04",
  prompt: "Kathy is a repair technician for a phone company. Each week, she receives a batch of phones that need repairs. The number of phones that she has left to fix at the end of each day can be estimated with the equation \\(P = 108 - 23d\\), where \\(P\\) is the number of phones left and \\(d\\) is the number of days she has worked that week. What is the meaning of the value \\(108\\) in this equation?",
  A: "Kath will complete the repairs within \\(108\\) days.",
  B: "Kathy starts each week with \\(108\\) phones to fix.",
  C: "Kathy repairs phones at a rate of \\(108\\) per hour.",
  D: "Kathy repairs pohnes at a rate of \\(108\\) per day.",
  answer_value: "B",
  answer_explanation: 
      "blank"
  )
  
    Question.create!(
  question_id: "0000.01.3.05",
  prompt: "\\[(x^2y - 3y^2 + 5xy^2) - (\\text{&ndash;}x^2y + 3xy^2 - 3y^2)\\] Which of the following is equivalent to the expression above?",
  A: "\\(4x^2y^2\\)",
  B: "\\(8xy^2 - 6y^2\\)",
  C: "\\(2x^2y + 2xy^2\\)",
  D: "\\(2x^2y + 8xy^2 - 6y^2\\)",
  answer_value: "C",
  answer_explanation: 
      "blank"
  )
  
      Question.create!(
  question_id: "0000.01.3.06",
  prompt: "\\[h = 3a + 28.6\\] A pediatrician uses the model above to estimate the height \\(h\\) of a boy, in inches, in terms of the boy's age \\(a\\) in years, between the ages of 2 and 5. Based on the model, what is the estimated increase, in inches, of a boy's height each year?",
  A: "\\(3\\)",
  B: "\\(5.7\\)",
  C: "\\(9.5\\)",
  D: "\\(14.3\)",
  answer_value: "A",
  answer_explanation: 
      "blank"
  )
  
        Question.create!(
  question_id: "0000.01.3.06",
  prompt: "\\[m = {( r \\over 1,200)(1+ r \\over 1,200)^N} \\over (1 + r \\over 1,200)^N -1 \\] A pediatrician uses the model above to estimate the height \\(h\\) of a boy, in inches, in terms of the boy's age \\(a\\) in years, between the ages of 2 and 5. Based on the model, what is the estimated increase, in inches, of a boy's height each year?",
  A: "\\(3\\)",
  B: "\\(5.7\\)",
  C: "\\(9.5\\)",
  D: "\\(14.3\)",
  answer_value: "A",
  answer_explanation: 
      "blank"
  )