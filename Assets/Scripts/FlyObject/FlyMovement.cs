using UnityEngine;

public class FlyMovement : MonoBehaviour
{
    [SerializeField] private VariableJoystick variableJoystick;


    void Start()
    {
        
    }

    void Update()
    {
        PlayerMove();
    }
    public void PlayerMove()
    {
        Move(GetVectorJoyStick());
    }

    public Vector3 GetVectorJoyStick()
    {
        return new Vector3(variableJoystick.Horizontal, 0f, variableJoystick.Vertical);
    }

    public void Move(Vector3 direction)
    {
        transform.Translate(direction * Time.deltaTime * 5f);
    }
}
