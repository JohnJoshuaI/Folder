const app = Vue.createApp({
    data(){
        return{
            courseName: 'CIS4339',
            assignmentName: 'Assignment 6',
            studentName: '',
            numbers_out: 0,
            array_position: 'First',
            Array1: [
                    {Text1: "Some text in an array 1", Numbers: Math.floor(Math.random() * 50), B1: true},
                    {Text2: "Some text in an array 2", Numbers: Math.floor(Math.random() * 50), B1: true},
                    {Text3: "Some text in an array 3", Numbers: Math.floor(Math.random() * 50), B1: true},
                    {Text4: "Some text in an array 4", Numbers: Math.floor(Math.random() * 50), B1: true},
                    {Text5: "Some text in an array 5", Numbers: Math.floor(Math.random() * 50), B1: true},
                    {Text6: "Some text in an array 6", Numbers: Math.floor(Math.random() * 50), B1: false},
                    {Text7: "Some text in an array 7", Numbers: Math.floor(Math.random() * 50), B1: false},
                    {Text10: "Some text in an array 8", Numbers: Math.floor(Math.random() * 50), B1: false},
                    {Text8: "Some text in an array 9", Numbers: Math.floor(Math.random() * 50), B1: false},
                    {Text9: "Some text in an array 10", Numbers: Math.floor(Math.random() * 50), B1: false},
                ],
                sum: 0,
                fontSize: 10
        
            }
        
    },

    computed:{
        sumOfNumbers(){
            return this.Array1.reduce((sum, numbers) =>{
                return sum += numbers.Numbers;
            }, 0)
        },
        sumOfFalse() {
            const falseB1Items = this.Array1.filter(item => !item.B1)
            return falseB1Items.reduce((sum, numbers) => sum += numbers.Numbers, 0)
        },
        sumOfTrue() {
            const trueB1Items = this.Array1.filter(item => item.B1)
            return trueB1Items.reduce((sum, numbers) => sum += numbers.Numbers, 0)
        },
    },
  

    methods: {
        setSetudentName(event){
            this.studentName = event.target.value
        },

        setFalseResults(){

        },
        setSumNum(){
            
        }
    },

    watch:{
        showData(value){
            for (let d=0; d < this.levels.length; d++){

            }
        }
    },

    
}).mount("#app")